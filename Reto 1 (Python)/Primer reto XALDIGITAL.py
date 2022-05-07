#!/usr/bin/env python
# coding: utf-8

# In[3]:


#RESPUESTA 1: CONECTARSE AL ENLACE
import pandas as pd
from IPython.display import display
import requests
import time
r=requests.get("https://api.stackexchange.com/2.2/search?order=desc&sort=activity&intitle=perl&site=stackoverflow").json()

#RESPUESTA 2: NUMERO DE RESPUESTAS CONTESTADAS Y NO CONTESTADAS
df=pd.DataFrame(r["items"])
c=df.apply(lambda x: x["is_answered"] == True, axis=1).sum()
nc=len(df.index)-c
print("El numero de respuestas contestadas son: ",c)
print("El numero de respuestas no contestadas son: ",nc)

#RESPUESTA 3: RESPUESTA CON MENOR NUMERO DE VISITAS
min_v= df[(df.view_count==min(df["view_count"]))]
print("\n\nLas menores visitas tienen:", min(df["view_count"]))
print("Correspondientes a los siguientes registros.")
display(min_v)

#RESPUESTA 4: OBTENER RESPUESTA MAS VIEJA Y MAS ACTUAL
#RESPUESTA MAS VIEJA
vieja=min(df["creation_date"])
print("\n\nLa respuesta mas vieja corresponde a la fecha: ",time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(vieja)))
print("Y tiene el siguiente registro.")
display(df[(df.creation_date==min(df["creation_date"]))])

#RESPUESTA MAS ACTUAL
actual=max(df["creation_date"])
print("\n\nLa respuesta mas actual corresponde a la fecha: ",time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(actual)))
print("Y tiene el siguiente registro.")
display(df[(df.creation_date==max(df["creation_date"]))])

#RESPUESTA 5: RESPUESTA DEL OWNER CON MAYOR REPUTACION
df1=pd.json_normalize(df["owner"])
index = df1[df1['reputation']==max(df1["reputation"])].index.tolist()
index=int(index[0])
print("\n\nLa mayor reputacion del owner es: ",max(df1["reputation"]))
print("Y la respuesta correspondiente es la siguiente.")
display(df[index:index+1])


# In[ ]:




