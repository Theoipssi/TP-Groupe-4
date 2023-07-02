# TP-Groupe-4

Créez le module ec2module pour déployer l'instance EC2, le groupe de sécurité et l'adresse IP publique, en suivant les instructions fournies dans les TP précédents.
Créez deux dossiers distincts, prod et dev, contenant chacun un fichier Terraform main.tf. Utilisez le module ec2module créé précédemment pour déployer une instance de taille t2.micro pour le dossier prod et t2.nano pour le dossier dev.
Assurez-vous de surcharger le tag pour que le nom de l'instance ait le format suivant : "Name: ec2-prod-<votre prenom>" pour la production et "Name: ec2-dev-<votre prenom>" pour le développement.
Lancez le déploiement des instances EC2 pour les environnements prod et dev en exécutant Terraform.
Vérifiez que les instances EC2 portent correctement le nom (Tag) et ont la bonne taille correspondant à l'environnement.
Supprimez les ressources créées en utilisant la commande terraform destroy.
Créez un dossier tp-6 pour archiver votre code, de la même manière que vous l'avez fait pour le TP-5.


et voici le compte rendu en URL: https://testipformation-my.sharepoint.com/:w:/g/personal/t_krzysztofinski_ecole-ipssi_net/EQhGSFYkWupDkCQqstn-8R8Bt69SEBpSok6is-MpHTXpUA?e=RavTCz
