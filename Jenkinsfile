pipeline {
	
	environment{
		registry = "vidhya3112/k8s-pipeline2"
		registryCredentials = 'docker-credentials'
		dockerImage = ''
		PROJECT_ID = 'rising-minutia-309213'
        	CLUSTER_NAME = 'cluster-1'
        	LOCATION = 'us-central1-c'
        	CREDENTIALS_ID = 'My First Project'
	}
	agent any
	stages
	{
	stage('Build image') {
        /* This builds the actual image */
            steps{
		    script{
        dockerImage = docker.build registry 
            }
	    }
    }
	stage('Push image') {
        /* 
			You would need to first register with DockerHub before you can push images to your account*/
		steps{
			script{
        docker.withRegistry('',registryCredentials) {
            dockerImage.push()
	}
            } 
                
        }
    }
		
	/*stage('Run container') {
         This builds the actual image 
            
		steps{
		    script{
        dockerImage.run("-p 8096:80 --rm --name pipecontainer")
            }
	    }
    } */
	stage('Upload Docker Image to GCR'){
        steps{
            sh 'docker tag vidhya3112/k8s-pipeline gcr.io/rising-minutia-309213/task2image":$BUILD_NUMBER"'
            sh 'docker push gcr.io/rising-minutia-309213/task2image":$BUILD_NUMBER"'
        }
    }
		
      stage('Deploy to Kubernetes'){
        steps{
	    sh "sed -i 's/task2image:latest/task2image:${env.BUILD_ID}/g' deployment.yml"
                step([$class: 'KubernetesEngineBuilder', projectId: env.PROJECT_ID, clusterName: env.CLUSTER_NAME, location: env.LOCATION, manifestPattern: 'deployment.yml', credentialsId: env.CREDENTIALS_ID, verifyDeployments: true])

       }
    }

        	
		
    }
}
