import cv2 as cv

faceCascade = cv.CascadeClassifier(cv.data.haarcascades + "haarcascade_frontalface_default.xml")
# eyeCascade = cv.CascadeClassifier(cv.data.haarcascades + "haarcascade_eye.xml")
# eyeCascade = cv.CascadeClassifier(cv.data.haarcascades + "haarcascade_eye_tree_eyeglasses.xml")

def create_dataset(img, id, img_id):
    cv.imwrite("data/pic."+str(id)+"."+str(img_id)+".jpg", img)

def draw_boundary(img, classifier, scaleFactor, minNeighbors, color, text):
    gray = cv.cvtColor(img, cv.COLOR_BGR2GRAY)
    features = classifier.detectMultiScale(gray, scaleFactor, minNeighbors)
    coords = []
    for (x,y,w,h) in features:
        cv.rectangle(img, (x,y), (x+w,y+h), color, 2)
        cv.putText(img, text, (x,y-4), cv.FONT_HERSHEY_SIMPLEX, 0.8, color, 1)
        coords = [x,y,w,h]
    return img, coords


def detect(img, faceCascade, img_id):
    img, coords = draw_boundary(img, faceCascade, 1.1, 10, (0,0,255), "Face")
    # img, coords = draw_boundary(img, eyeCascade, 1.1, 12, (0,255,0), "Eye")
    
    if len(coords) == 4:
        # img[y:y+h, x:x+w]
        id=1
        result = img[coords[1]:coords[1]+coords[3], coords[0]:coords[0]+coords[2]]
        #create_dataset(result, id, img_id)
    return img

img_id=0
cap = cv.VideoCapture(0)
# cap = cv.VideoCapture(<PATH_TO_VIDEO>)


while (1):
    ret, frame = cap.read()
    frame = detect(frame, faceCascade, img_id)
    cv.imshow('frame',frame)
    img_id += 1
    # gray = cv.cvtColor(frame, cv.COLOR_BGR2GRAY)
    # cv.imshow('frame',gray)
    if(cv.waitKey(1) & 0xFF == ord('q')):
        break
cap.release()
cv.destroyAllWindows()