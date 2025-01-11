#2877. Create a DataFrame from List
import pandas as pd

def createDataframe(student_data: List[List[int]]) -> pd.DataFrame:
    
    df = pd.DataFrame(student_data, columns=["student_id", "age"])
    
    return df 

#2878. Get the Size of a DataFrame
import pandas as pd

def getDataframeSize(players: pd.DataFrame) -> List[int]:

    return list(players.shape)

#2879. Display the First Three Rows
import pandas as pd

def selectFirstRows(employees: pd.DataFrame) -> pd.DataFrame:
    
    return employees.head(3)

#2880. Select Data
import pandas as pd

def selectData(students: pd.DataFrame) -> pd.DataFrame:
    
    return students.loc[students["student_id"] == 101, ["name", "age"]]

#2881. Create a New Column
import pandas as pd

def createBonusColumn(employees: pd.DataFrame) -> pd.DataFrame:
    
    employees["bonus"] = employees["salary"] * 2

    return employees

#2882. Drop Duplicate Rows
import pandas as pd

def dropDuplicateEmails(customers: pd.DataFrame) -> pd.DataFrame:
    
    return customers.drop_duplicates("email")

#2883. Drop Missing Data
import pandas as pd

def dropMissingData(students: pd.DataFrame) -> pd.DataFrame:
    
    return students.dropna(subset=["name"])

#2884. Modify Columns
import pandas as pd

def modifySalaryColumn(employees: pd.DataFrame) -> pd.DataFrame:
    
    employees["salary"] = employees["salary"] * 2

    return employees

#2885. Rename Columns
import pandas as pd

def renameColumns(students: pd.DataFrame) -> pd.DataFrame:
    
    students.rename(columns={"id": "student_id", 
        "first": "first_name", 
        "last": "last_name", 
        "age": "age_in_years"}, inplace=True)
        
    return students

#2886. Change Data Type
import pandas as pd

def changeDatatype(students: pd.DataFrame) -> pd.DataFrame:
    
    students["grade"] = students["grade"].astype(int)

    return students

#2887. Fill Missing Data
import pandas as pd

def fillMissingValues(products: pd.DataFrame) -> pd.DataFrame:
    
    products["quantity"] = products["quantity"].fillna(0)

    return products

#2888. Reshape Data: Concatenate
import pandas as pd

def concatenateTables(df1: pd.DataFrame, df2: pd.DataFrame) -> pd.DataFrame:
    
    return pd.concat([df1, df2])

#2889. Reshape Data: Pivot
import pandas as pd

def pivotTable(weather: pd.DataFrame) -> pd.DataFrame:
    
    return weather.pivot_table(index='month', columns='city', values='temperature', aggfunc='max')

#2890. Reshape Data: Melt
import pandas as pd

def meltTable(report: pd.DataFrame) -> pd.DataFrame:
    
    return pd.melt(report, id_vars=['product'], var_name='quarter', value_name='sales')

#2891. Method Chaining
import pandas as pd

def findHeavyAnimals(animals: pd.DataFrame) -> pd.DataFrame:
    
    return animals[animals['weight'] > 100].sort_values(['weight'],ascending=False)[['name']]
