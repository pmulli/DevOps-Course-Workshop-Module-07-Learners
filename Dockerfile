FROM mcr.microsoft.com/dotnet/sdk:5.0

RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install -y nodejs

WORKDIR /app

COPY DotnetTemplate.Web/ ./

RUN dotnet build
RUN npm ci
RUN npm run build

ENTRYPOINT dotnet rundotnettemplate