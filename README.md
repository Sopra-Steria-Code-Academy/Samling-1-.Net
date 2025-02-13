# Samling 1

## Oppgaver
1. Lag en github action som bygger prosjektet ditt
2. Lag en github action som kjører kodeanalyse mot sonarqube
   - Legg inn en SONAR_HOST_URL som secrets i ditt repository 
   - Legg inn en SONAR_TOKEN som secrets i ditt repository
3. Legg inn verdier i backend.tf filen (noen felter mangler verdier)
4. Legg inn default verdier i variables.tf filen
4. Lag en github action som lager ressurser med terraform filer
   - Legg inn en TF_AZURE_CLIENT_ID som secrets i ditt repository
   - Legg inn en TF_AZURE_SUBSCRIPTION_ID som secrets i ditt repository
   - Legg inn en TF_AZURE_TENANT_ID som secrets i ditt repository
5. Lag en github action som sjekker drift-deteksjon
6. Lag en github action som deployer applikasjonen din til azure
   - Legg inn en AZURE_CLIENT_ID som secrets i ditt repository
   - Legg inn en AZURE_CLIENT_SECRET som secrets i ditt repository
   - Legg inn en AZURE_SUBSCRIPTION_ID som secrets i ditt repository
   - Legg inn en AZURE_TENANT_ID som secrets i ditt repository
   - Last ned publish profile og legg inn en AZURE_WEBAPP_PUBLISH_PROFILE som secrets i ditt repository
