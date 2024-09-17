name: Deploy to EC2

on:
  push:
    branches:
      - task4

jobs:
  deploy:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v3

      - name: Set up SSH
        uses: webfactory/ssh-agent@v0.5.4
        with:
          ssh-private-key: ${{ secrets.EC2_SSH_KEY }}

      - name: Deploy Docker Compose
        run: |
          ssh -o StrictHostKeyChecking=no ubuntu@${{ secrets.EC2_HOST }} << 'EOF'
            cd /home/ubuntu
            docker-compose pull
            docker-compose up -d
          EOF
