from flask import Blueprint, request, render_template, make_response
from io import StringIO
import io
import csv
import pandas as pd
import tempfile
#from ressarcimento.models import Dupli

main_bp=Blueprint('main',__name__)

@main_bp.route('/')
def index():
    return render_template('index.html')

""" @app.route('/',methods = ['POST'])
def upload_route_summary():
    if request.method == 'POST':
        # Pega o arquivo do formulário que contém o nome fileupload.
        file = request.files['fileupload']
        # Decode the file using "ISO-8859-1" because my CSV seems to use this 
        # encoding (for example: utf-8 don't work)
        #file.read() deixa em binário
        fileContent = StringIO(file.read().decode("ISO-8859-1"))
        #reader = list(csv.reader(fileContent, delimiter = ';'))
        #for row in reader:
         #   print(row)
        reader=pd.read_csv(fileContent, delimiter = ';')
        print(reader)
    return "success" """


""" @app.route('/', methods=["POST"])
def transform_view():
    f = request.files['fileupload']
    f2=request.files.get['fileupload']
    if not f:
        return "No file"

        
    tempfile_path = tempfile.NamedTemporaryFile().name
    f.save(tempfile_path)
    stream = io.StringIO(f.stream.read().decode("ISO-8859-1"), newline=None)
    csv_input = csv.reader(stream)
    stream2=pd.read_csv(io.StringIO(f.read().decode("utf-8")),engine='python')
    df=pd.read_csv(f2)
    #print("file contents: ", file_contents)
    #print(type(file_contents))
    print(csv_input)
    for row in csv_input:
        print(row)

    stream2.seek(0)
    stream.seek(0)
    result = transform(stream.read())

    #response = make_response(result)
    #response.headers["Content-Disposition"] = "attachment; filename=result.csv"
    return render_template('index.html',df=df) """     


#OPÇçAO COM O PANDAS
@main_bp.route('/', methods=['POST'])
def upload():
    # Input file
    r1 = request.files['r1']
    r2=request.files['r2']
    r3=request.files.getlist("r3")
    if not r1: #or not r2 or not r3:
        return "There is missing a file"
    #for file in r3:
     #     file.save(secure_filename(file.filename))
      #return 'file uploaded successfully'
    tempfile_path = tempfile.NamedTemporaryFile().name
    r1.save(tempfile_path)
    sheet = pd.read_csv(tempfile_path,encoding="ISO-8859-1",sep='\t', lineterminator='\r')
    # Put input file in dataframe
    for row in sheet:
        print(row)
    print(sheet)
    #No html-javascript alterar pra colocar o id dentro do value do form 
    valor=request.form['submit_name']
    print(valor)
    if(valor==1):
        r
    #https://stackoverflow.com/questions/26217779/how-to-get-the-name-of-a-submitted-form-in-flask
    return render_template('index.html',sheet=sheet) 
