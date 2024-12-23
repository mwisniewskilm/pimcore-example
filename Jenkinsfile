pipeline {
    agent any
    stages {
        stage('Containers Preparation') {
            steps {
                sh 'echo "TEST PREPARATION"'
            }
        }
        stage('Composer install') {
            steps {
                sh 'echo "TEST PREPARATION"'
            }
        }
        stage('Pimcore Test Installation') {
            steps {
                sh 'echo "TEST PREPARATION"'
            }
        }
        stage('CSFixer analysis') {
            steps {
                sh 'echo "TEST PREPARATION"'
            }
        }
        stage('Static code analysis') {
            parallel {
                stage('PHPStan analysis') {
                    steps {
                        sh 'echo "TEST PREPARATION"'
                    }
                },
                stage('PHPMD analysis') {
                    steps {
                        sh 'echo "TEST PREPARATION"'
                    }
                }
            }
        }
        stage('Running tests') {
            steps {
                sh 'echo "TEST PREPARATION"'
            }
        }
        stage('Cleanup') {
            steps {
                sh 'echo "TEST PREPARATION"'
            }
        }
        stage('Remote containers stop') {
            steps {
                sh 'echo "TEST PREPARATION"'
            }
        }
        stage('Remote files delivery') {
            steps {
                sh 'echo "TEST PREPARATION"'
            }
        }
        stage('Remote containers start') {
            steps {
                sh 'echo "TEST PREPARATION"'
            }
        }
        stage('Remote build') {
            steps {
                sh 'echo "TEST PREPARATION"'
            }
        }
        stage('Remote frontend build') {
            steps {
                sh 'echo "TEST PREPARATION"'
            }
        }


        // stage('Static Analysis') {
        //     parallel {
        //         stage('PHPStan') {
        //             steps {
        //                 sh 'pwd'  // Check current directory
        //                 sh 'ls -l' // Check if vendor/bin/phpstan exists
        //                 sh 'vendor/bin/phpstan analyze -c phpstan.neon --error-format=checkstyle --no-progress -n . > logs/phpstan.checkstyle.xml'
        //             }
        //         }
        //     }
        // }


        stage('Finishing') {
            steps {
                sh 'ls -ll -a' // Example PHP build step
            }
        }
    }

    // post {
    //     always {
    //         recordIssues([
    //             sourceCodeEncoding: 'UTF-8',
    //             enabledForFailure: true,
    //             aggregatingResults: true,
    //             // blameDisabled: true,
    //             // referenceJobName: "testjenkinsphp/main",
    //             tools: [
    //                 phpStan(id: 'phpstan', name: 'PHPStan', pattern: 'logs/phpstan.checkstyle.xml', reportEncoding: 'UTF-8')
    //             ]
    //         ])
    //     }
    // }
}