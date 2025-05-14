from fastapi import FastAPI, Query
import pyodbc
from dotenv import load_dotenv
import os
from typing import Optional
from datetime import date

load_dotenv(dotenv_path="./app/.env")
app = FastAPI()

#DB Connection Open

server = os.getenv('DB_SERVER')
database = os.getenv('DB_NAME')
driver = os.getenv('DB_DRIVER')

conn_str = (
    f"DRIVER={{{driver}}};"  
    f"SERVER={server};"
    f"DATABASE={database};"
    "Trusted_Connection=yes;"
    "TrustServerCertificate=yes;"
)
try:
    conn = pyodbc.connect(conn_str)
    print("Connected")
    conn.close()
except Exception as e:
    print("Connection Failed: ", e)
#DB Connection Close
@app.get("/")
def root():
    return {"Message": "Welcome to Hamza's Task for Forsit"}

@app.get("/GetSales")
def get_sales(
    productid: Optional[int] = Query(None),
    cateid: Optional[int] = Query(None),
    mindate: Optional[date] = Query(None),
    maxdate: Optional[date] = Query(None)
):
    try:
        with pyodbc.connect(conn_str) as conn:
            cursor = conn.cursor()
            cursor.execute(
                "EXEC GetSales @ProductID=?, @MinDate=?, @MaxDate=?, @CateID=?",
                productid,
                mindate,
                maxdate,
                cateid
            )

            columns = [column[0] for column in cursor.description]
            results = [dict(zip(columns, row)) for row in cursor.fetchall()]
            return {"data": results}

    except Exception as e:
        return {"error": str(e)}

@app.get("/GetRevenues")
def get_revenues(
    productid: Optional[int] = Query(None),
    cateid: Optional[int] = Query(None),
    mindate: Optional[date] = Query(None),
    maxdate: Optional[date] = Query(None)
):
    try:
        with pyodbc.connect(conn_str) as conn:
            cursor = conn.cursor()
            cursor.execute(
                "EXEC GetRevenues @ProductID=?, @MinDate=?, @MaxDate=?, @CateID=?",
                productid,
                mindate,
                maxdate,
                cateid
            )

            columns = [column[0] for column in cursor.description]
            results = [dict(zip(columns, row)) for row in cursor.fetchall()]
            return {"data": results}

    except Exception as e:
        return {"error": str(e)}

@app.get("/GetInvStatus")
def get_invstatus(
    lowstock: Optional[int] = Query(None),
    productid: Optional[int] = Query(None),
    cateid: Optional[int] = Query(None),
):
    try:
        with pyodbc.connect(conn_str) as conn:
            cursor = conn.cursor()
            cursor.execute(
                "EXEC GetInvStatus @LowStock=?, @ProductID=?, @CateID=?",
                lowstock,
                productid,
                cateid
            )

            columns = [column[0] for column in cursor.description]
            results = [dict(zip(columns, row)) for row in cursor.fetchall()]
            return {"data": results}

    except Exception as e:
        return {"error": str(e)}

@app.get("/GetProducs")
def get_products(
    productid: Optional[int] = Query(None),
    productname: Optional[str] = Query(None),
    mindate: Optional[str] = Query(None),
    maxdate: Optional[str] = Query(None),
    cateid: Optional[int] = Query(None),
    vendorname: Optional[str] = Query(None),
    productprice: Optional[str] = Query(None)
):
    try:
        with pyodbc.connect(conn_str) as conn:
            cursor = conn.cursor()
            cursor.execute(
                "EXEC GetProducts @ProductID=?, @ProductName=?, @MinDate=?, @MaxDate=?, @CateID=?, @VendorName=?, @ProductPrice=?",
                productid,
                productname,
                mindate,
                maxdate,
                cateid,
                vendorname,
                productprice
            )

            columns = [column[0] for column in cursor.description]
            results = [dict(zip(columns, row)) for row in cursor.fetchall()]
            return {"data": results}

    except Exception as e:
        return {"error": str(e)}

@app.post("/AddUpdateProduct")
def add_product(
    productid: Optional[int] = Query(None),
    productname: Optional[str] = Query(None),
    productdescription: Optional[str] = Query(None),
    productprice: Optional[str] = Query(None),
    vendorname: Optional[str] = Query(None),
    cateid: Optional[int] = Query(None),
    action: Optional[str] = Query(None),
    
):
    try:
        with pyodbc.connect(conn_str) as conn:
            cursor = conn.cursor()
            cursor.execute(
                "EXEC AddProduct @ProductID=?, @ProductName=?, @ProductDescription=?, @ProductPrice=?, @VendorName=?, @CateID=?, @Action=?",
                productid,
                productname,
                productdescription,
                productprice,
                vendorname,
                cateid,
                action
            )
            return cursor.fetchone()[0]


    except Exception as e:
        return {"error": str(e)}
    
@app.post("/AddUpdateInventory")
def add_inventory(
    productid: Optional[int] = Query(None),
    stocks: Optional[int] = Query(None),
    
):
    try:
        with pyodbc.connect(conn_str) as conn:
            cursor = conn.cursor()
            cursor.execute(
                "EXEC UpdateInventory @ProductID=?, @Stocks=?",
                productid,
                stocks
            )
            return cursor.fetchone()[0]

    except Exception as e:
        return {"error": str(e)}

@app.post("/GenerateSale")
def gen_sale(
    productid: Optional[int] = Query(None),
    quantity: Optional[int] = Query(None),
    
):
    try:
        with pyodbc.connect(conn_str) as conn:
            cursor = conn.cursor()
            cursor.execute(
                "EXEC OnSale @ProductID=?, @Quantity=?",
                productid,
                quantity
            )
            return cursor.fetchone()[0]

    except Exception as e:
        return {"error": str(e)}