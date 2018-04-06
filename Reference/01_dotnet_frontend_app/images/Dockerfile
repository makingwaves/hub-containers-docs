FROM microsoft/dotnet-nightly:2.1-sdk AS build-env
WORKDIR /app

# copy csproj and restore as distinct layers
COPY *.csproj ./
COPY NuGet.config ./
RUN dotnet restore -v detailed

# copy everything else and build
COPY . ./
RUN dotnet publish -c Release -o out --no-restore


# build runtime image
FROM microsoft/dotnet-nightly:2.1-runtime-alpine
WORKDIR /app
COPY --from=build-env /app/out ./
ENTRYPOINT ["dotnet", "dotnetapp.dll"]
