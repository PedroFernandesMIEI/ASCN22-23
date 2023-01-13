sudo apt-get dist-upgrade -y
sudo apt install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible -y
sudo apt-get update -y
sudo apt-get install -y python3-google-auth

echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
sudo apt update
sudo apt-get install google-cloud-sdk-gke-gcloud-auth-plugin kubectl
export USE_GKE_GCLOUD_AUTH_PLUGIN=True
gcloud auth activate-service-account azure-devops-service-account@projeto-ascn.iam.gserviceaccount.com \
          --key-file <(echo "gcp-credentials/symbolic-surf-373522-1c7f2686ad0f.json"  | base64 -d)
(echo gcp-credentials/symbolic-surf-373522-1c7f2686ad0f.json | base64 -d) > $HOME/.config/gcloud/application_default_credentials.json



gcloud container clusters get-credentials ascn-cluster \
  --region europe-west2-a \
  --project projeto-ascn \
  --internal-ip

