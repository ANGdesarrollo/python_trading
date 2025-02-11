# Usar Miniconda con Python 3.10 para asegurar compatibilidad con ta-lib
FROM continuumio/miniconda3:23.3.1-0

# Evitar buffer en logs de Python
ENV PYTHONUNBUFFERED 1

# Crear y configurar el directorio de trabajo
WORKDIR /app

# Copiar el archivo de requerimientos
COPY requirements.txt ./

# Instalar ta-lib con Conda
RUN conda install -y -c conda-forge ta-lib && conda clean -afy

# Instalar dependencias de Python desde requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Instalar Jupyter Notebook
RUN pip install notebook

# Copiar la carpeta notebooks al contenedor
COPY notebooks /app/notebooks

# Exponer el puerto de Jupyter Notebook
EXPOSE 8888

# Comando para ejecutar Jupyter Notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''"]
