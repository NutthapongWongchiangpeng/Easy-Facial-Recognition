import cv2 as cv
print(cv.__version__)
img = cv.imread("AirportHimePuchi.jpg",1)
# img = cv.line(img,(0,0),(255,255),(0,0,255),10)
# img = cv.arrowedLine(img,(0,0),(300,300),(255,0,255),10)

cv.imshow('Image', img)
cv.waitKey(0)

cv.destroyAllWindows()
#cv.imwrite('result.png',img)