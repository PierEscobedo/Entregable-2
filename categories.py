import pyodbc;

class Categories:
    def __init__(self):
        #self.conn = pyodbc.connect('DRIVER={SQL SERVER};SERVER=DESKTOP-SC4TSI1;DATABASE=DB_SALES;UID=sa;PWD=Los_@_Gremlins2025')
        self.conn = pyodbc.connect('DRIVER={SQL SERVER};SERVER=DESKTOP-SC4TSI1;DATABASE=DB_CRM;')
        self.cursor = self.conn.cursor()

    def create(self, category_id, name, description, ind_level):
        result = {}
        result["message"] = "EL registro fue realizado con éxito."
        sql = f"EXECUTE store.up_category_create {category_id}, '{name}', '{description}', {ind_level};"
        self.cursor.execute(sql)
        self.conn.commit()
        return result
    
    def update(self, id, category_id, name, description, ind_level):
        result = {}
        result["message"] = "EL registro fue actualizado con éxito."
        sql = f"EXECUTE store.up_category_update {id}, {category_id}, '{name}', '{description}', {ind_level};"
        self.cursor.execute(sql)
        self.conn.commit()
        return result
    
    def delete(self, id):
        result = {}
        result["message"] = "EL registro fue eliminado con éxito."
        sql = f"EXECUTE store.up_category_delete {id};"
        self.cursor.execute(sql)
        self.conn.commit()
        return result

    def getAll(self):
        result = []
        sql = "EXECUTE store.up_category_list;"
        self.cursor.execute(sql)
        for row in self.cursor.fetchall():
            item = {}
            item["id"] = row[0]
            item["category_id"] = row[1]
            item["category_parent_name"] = row[2]
            item["name"] = row[3]
            item["description"] = row[4]
            item["ind_level"] = row[5]
            item["ind_status"] = row[6]
            item["create_at"] = row[7]
            item["update_at"] = row[8]
            result.append(item)
        return result

    def getById(self, id):
        result = {}
        sql = f"EXECUTE store.up_category_find_by_id {id};"
        self.cursor.execute(sql)
        for row in self.cursor.fetchall():
            item = {}
            item["id"] = row[0]
            item["category_id"] = row[1]
            item["category_parent_name"] = row[2]
            item["name"] = row[3]
            item["description"] = row[4]
            item["ind_level"] = row[5]
            item["ind_status"] = row[6]
            item["create_at"] = row[7]
            item["update_at"] = row[8]
            result = item
        return result