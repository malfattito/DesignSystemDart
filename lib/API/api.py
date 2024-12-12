from flask import Flask, request, jsonify
import yt_dlp
import os

app = Flask(__name__)

@app.after_request
def after_request(response):
    response.headers.add('Access-Control-Allow-Origin', '*')
    response.headers.add('Access-Control-Allow-Headers', 'Content-Type,Authorization')
    response.headers.add('Access-Control-Allow-Methods', 'GET,OPTIONS')
    return response

@app.route('/API', methods=['GET'])
def download_video():
    url = request.args.get('url')
    if not url:
        return jsonify({'error': 'URL do vídeo não fornecida'}), 400

    try:
        # Certifique-se de que o diretório de downloads existe
        download_path = 'Downloads'
        if not os.path.exists(download_path):
            os.makedirs(download_path)

        # Configuração do yt-dlp
        ydl_opts = {
            'outtmpl': f'{download_path}/%(title)s.%(ext)s',  # Formato do nome do arquivo
            'format': 'best'  # Melhor qualidade disponível
        }
        
        # Baixar o vídeo
        with yt_dlp.YoutubeDL(ydl_opts) as ydl:
            info = ydl.extract_info(url, download=True)

        # Montar o caminho completo do arquivo baixado
        file_name = f"{info['title']}.{info['ext']}"  # Gera o nome do arquivo com extensão
        file_path = os.path.join(download_path, file_name)

        # Verifique se o arquivo realmente foi baixado
        if os.path.exists(file_path):
            return jsonify({
                'message': 'Download concluído',
                'title': info['title'],
                'path': file_path
            }), 200
        else:
            return jsonify({'error': 'Falha no download do vídeo'}), 500

    except yt_dlp.utils.DownloadError as de:
        return jsonify({'error': 'Erro no download: ' + str(de)}), 500
    except Exception as e:
        return jsonify({'error': 'Erro desconhecido: ' + str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True)
