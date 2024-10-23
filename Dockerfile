# Base oficial do Node.js versão 18
FROM node:18-alpine

# Definindo o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copiando o arquivo package.json e package-lock.json
COPY package*.json ./

# Instalando as dependências
RUN npm install --production

# Copiando o restante do código da aplicação
COPY . .

# Executa o build da aplicação
RUN npm run build

# Expondo a porta que o Vite usa no modo preview
EXPOSE 5173

# Comando para iniciar a aplicação no modo preview do Vite
CMD ["npm", "run", "preview", "--", "--host", "--port", "5173"]
