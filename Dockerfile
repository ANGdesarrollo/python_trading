FROM python:3.9

# Configurar el directorio de trabajo en el contenedor
WORKDIR /app

# Copiar el archivo de requerimientos y instalar dependencias
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Instalar Jupyter Notebook
RUN pip install notebook

# Crear directorio notebooks y establecer permisos
RUN mkdir -p /app/notebooks

# Exponer el puerto de Jupyter Notebook
EXPOSE 8888

# Comando para ejecutar Jupyter Notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''"]
