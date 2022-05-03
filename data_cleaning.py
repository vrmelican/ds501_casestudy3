import pandas as pd

df = pd.read_csv("Austin_Animal_Center_Outcomes.csv");

#filter by animal type (cats) and year (2019)
df = df[df["Animal Type"] == "Cat"]
df["Month"] = df["MonthYear"].apply(lambda x: x.split(" ")[0])
df["Year"] = df["MonthYear"].apply(lambda x: int(x.split(" ")[1]))

#separate "Sex upon Outcome" to "Fixed?" and "Sex" variables
df = df[df["Sex upon Outcome"] != "Unknown"]
df["Fixed"] = df["Sex upon Outcome"].apply(lambda x: x.split(" ")[0])
df["Fixed"] = df["Fixed"].apply(lambda x: "Intact" if x == "Intact" else "Fixed")
df["Sex"] = df["Sex upon Outcome"].apply(lambda x: x.split(" ")[1])

#filter "Outcome Type" variable to keep only Adoption and Euthanasia categories
df = df[df["Outcome Type"].isin(["Adoption", "Euthanasia"])]

#filter by age to only keep cats aged 1 and over
def convertAgeToYears(age):
    val = int(age.split(" ")[0])
    units = age.split(" ")[1]
    newAge = 0
    
    if units == "day" or units == "days":
        newAge = val / 365
    elif units == "week" or units == "weeks":
        newAge = val / 52
    elif units == "month" or units == "months":
        newAge = val / 12
    elif units == "year" or units == "years":
        newAge = val
        
    if newAge < 1:
        return 0
    return newAge

df = df[df["Age upon Outcome"].notnull()]
df["Age"] = df["Age upon Outcome"].apply(lambda x: convertAgeToYears(x))
df = df[df["Age"] > 0]

#drop extra variables
df.drop(["Animal ID", "Name", "DateTime", "MonthYear", "Date of Birth", "Sex upon Outcome", "Age upon Outcome", "Animal Type", "Outcome Subtype"], axis=1, inplace=True)

#randomly sample 250 per class
adoption = df.loc[df["Outcome Type"] == "Adoption"]
adoption = adoption.sample(500)
euthanasia = df.loc[df["Outcome Type"] == "Euthanasia"]
euthanasia = euthanasia.sample(500)

df = pd.concat([adoption, euthanasia])
df = df.sample(frac=1).reset_index(drop=True)

#create an other category for high-dimensional variables (color and breed)
color_counts = df["Color"].value_counts()
breed_counts = df["Breed"].value_counts()
length = len(df)
df["Color"] = df["Color"].apply(lambda x: "Other" if color_counts[x] < (length * 0.05) else x)
df["Breed"] = df["Breed"].apply(lambda x: "Other" if breed_counts[x] < (length * 0.05) else x)

#save cleaned dataframe
df.to_csv("data.csv", index=False)