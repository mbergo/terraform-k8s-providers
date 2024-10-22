# Explicação do Setup Kubernetes com Terraform e Ansible

## Setup 


1. **Script de setup do Terraform para Kubernetes**: Este script cria uma estrutura de projeto Terraform para provisionar um cluster Kubernetes em múltiplas clouds (AWS, GCP e VMware).

2. **Script de setup do Ansible para Kubernetes**: Este script cria uma estrutura de projeto Ansible para configurar e instalar um cluster Kubernetes nos servidores provisionados.

### Estrutura do Projeto Terraform

O projeto Terraform inclui:

- Módulos para networking, etcd, kubernetes e load balancer
- Configurações específicas para cada cloud provider
- Variáveis e outputs para flexibilidade e reutilização

### Estrutura do Projeto Ansible

O projeto Ansible inclui:

- Roles para configuração comum, etcd, master e worker nodes
- Playbooks para orquestrar a instalação do cluster
- Inventário para definir os hosts do cluster

## Como executar um setup completo

Para executar um setup completo nas clouds suportadas, siga estes passos:

### 1. Preparação

1. Certifique-se de ter instalado:
   - Terraform
   - Ansible
   - AWS CLI (para AWS)
   - gcloud CLI (para GCP)
   - govc CLI (para VMware)

2. Configure as credenciais para sua cloud:
   - AWS: `aws configure`
   - GCP: `gcloud auth login`
   - VMware: Configure as variáveis de ambiente GOVC_*

### 2. Provisionamento da Infraestrutura com Terraform

1. Navegue até o diretório do projeto Terraform:
   ```
   cd kubernetes-terraform-project
   ```

2. Inicialize o Terraform:
   ```
   terraform init
   ```

3. Escolha o ambiente desejado (aws, gcp ou vmware) e copie o arquivo `terraform.tfvars` correspondente para o diretório raiz:
   ```
   cp environments/aws/terraform.tfvars .
   ```

4. Revise e ajuste as variáveis no arquivo `terraform.tfvars` conforme necessário.

5. Planeje a execução:
   ```
   terraform plan
   ```

6. Aplique a configuração:
   ```
   terraform apply
   ```

7. Após a conclusão, anote os IPs dos servidores provisionados.

### 3. Configuração do Cluster com Ansible

1. Navegue até o diretório do projeto Ansible:
   ```
   cd ../ansible-k8s-setup
   ```

2. Atualize o arquivo de inventário `inventories/k8s_cluster` com os IPs dos servidores provisionados pelo Terraform.

3. Revise e ajuste as variáveis em `group_vars/all.yml` conforme necessário.

4. Execute o playbook principal:
   ```
   ansible-playbook -i inventories/k8s_cluster site.yml
   ```

### 4. Verificação

Após a conclusão do Ansible, você pode verificar o cluster:

1. SSH no primeiro nó master:
   ```
   ssh ubuntu@<IP_DO_MASTER>
   ```

2. Verifique o status do cluster:
   ```
   kubectl get nodes
   kubectl get pods --all-namespaces
   ```

## Notas importantes

- Certifique-se de ter as permissões necessárias nas respectivas clouds antes de iniciar o provisionamento.
- Os scripts fornecidos são um ponto de partida e podem necessitar de ajustes conforme seus requisitos específicos.
- Lembre-se de destruir os recursos após o uso para evitar custos desnecessários:
  ```
  terraform destroy
  ```
- Para VMware, você pode precisar de configurações adicionais dependendo do seu ambiente específico.

## Customização

- Para adicionar ou modificar recursos, ajuste os módulos Terraform correspondentes.
- Para alterar a configuração do Kubernetes, modifique os roles Ansible relevantes.
- Você pode adicionar mais variáveis aos arquivos `terraform.tfvars` e `group_vars/all.yml` para maior flexibilidade.

Este setup fornece uma base sólida para implantar clusters Kubernetes em diferentes ambientes de nuvem. Adapte conforme necessário para atender às necessidades específicas do seu projeto ou organização.
