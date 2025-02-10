# Usa la imagen oficial de Jupyter con herramientas científicas preinstaladas
FROM jupyter/scipy-notebook:latest

# Copia el archivo de dependencias al contenedor
COPY requirements.txt /home/jovyan/requirements.txt

# Instala las dependencias de Python dentro del contenedor
RUN pip install --no-cache-dir -r /home/jovyan/requirements.txt

# Asegura permisos adecuados para el usuario jovyan
USER root
RUN chown -R jovyan:users /home/jovyan

# Regresa a usuario jovyan para evitar problemas de permisos
USER jovyan
