from django.urls import include, path
from django.db import connections
import importlib
import types


# import _mysql

def readNewModule(install_apps):
    try:
        db_conn = connections['default']
        cursor = db_conn.cursor()
        cursor.execute(
            sql="""SELECT id,name,module,install_app,url_app,url_path,alis_url_app, is_active from module_config where is_active = 1""")
        results = cursor.fetchall()
        for row in results:
            if _loadModule(row):
                
                if row[3] not in install_apps :
                    print("load Module :\t%s" % (row[3]))
                    install_apps.append(row[3])
                else:
                    print("load Module already in setting :\t%s" % (row[3]))
    except Exception as ex:
        print("error - readNewModule : %s" % ex)


def readNewUrl(urlpatterns):
    try:
        db_conn = connections['default']
        cursor = db_conn.cursor()
        cursor.execute(
            sql="""SELECT id,name,module,install_app,url_app,url_path,alis_url_app, is_active from module_config""")
        results = cursor.fetchall()
        for row in results:
            if _loadModule(row):
                print("load url :\t%s" % (row[3]))
                urlpatterns.append(path(row[5], include(row[4]), name=row[6]))
    except Exception as ex:
        print("error - readNewUrl : %s" % ex)


def readPublicView(public_views):
    try:
        db_conn = connections['default']
        cursor = db_conn.cursor()
        cursor.execute(sql="""SELECT id,name,module,install_app from module_public_view_config where is_active = 1""")
        results = cursor.fetchall()
        for row in results:

            class_data = row[3].split(".")
            module_path = ".".join(class_data[:-1])
            class_str = class_data[-1]
            # print(row[3])
            module = importlib.util.find_spec(module_path)
            if module:
                public_views.append(row[3])
                print("load public :\t%s" % (row[3]))
        print (public_views)
    except Exception as ex:
        print("error - readPublicView : %s" % ex)


def readSystemConfig(system_config):
    try:
        db_conn = connections['default']
        cursor = db_conn.cursor()
        cursor.execute(sql="""SELECT id,config_name,config_value from system_config where is_active = 1""")
        results = cursor.fetchall()
        for row in results:
            system_config[str(row[1])] = row[2]

        print(system_config)
    except Exception as ex:
        print("error - readSystemConfig : %s" % ex)


def _loadModule(row):
    try:
        class_data = row[3].split(".")
        module_path = ".".join(class_data[:-1])
        class_str = class_data[-1]
        # print ("module_path:class_str -> %s.%s" %(module_path ,class_str))
        module = importlib.import_module(module_path)
        # print(module)
        className = getattr(module, class_str)
        return True
    except Exception as ex:
        print("error : %s" % ex)
        return False


class AuthRouter:
    def db_for_read(self, model, **hints):
        return self._selectdbname(model)

    # def db_for_write(self, model, **hints):
    #    return self._selectdbname(model)

    def _selectdbname(self, model):
        if model.__name__ == 'IotData':
            return 'iotdata'
        return 'default'

# sample = ('LoginView','LoginView','LoginView','uihiotnotify.iotnotify.restiot.RestIOTView')
# uihiotnotify.iotnotify.restiot:RestIOTView
# _loadModule(sample)
# spam_loader = importlib.util.find_spec('uihiotnotify.util.mongoutil.MongoDBUtil')


# print(importlib.import_module(name='uihiotnotify.iotnotify.restiot'))#, package= 'uihiotnotify.util'))#, package=None)
# print (spam_loader)


def readAdminReorderConfig(admin_reorder):
    try:
        db_conn = connections['default']
        cursor = db_conn.cursor()
        cursor.execute(sql="""SELECT app,label,model FROM admin_reorder_config where is_active = 1  order by ordinal ASC""")
        results = cursor.fetchall()
        for row in results:
            if row[2] is None  or row[2] == '':
                admin_reorder.append({'app': str(row[0]),'label': str(row[1])})
            else:
                admin_reorder.append({'app': str(row[0]) ,'label': str(row[1]) ,'models': row[2].split(",")})
        #print(admin_reorder)
    except Exception as ex:
        print("error - readAdminReorderConfig : %s" % ex)