This is a simple web app that creates and configures servers in AWS.  For it to work, you'll need first rename the .env.example file to .env.  Add AWS private and public keys, and link to a ssh public and private key.  These will be uploaded to the EC2 instance as the ssh keys. The application will use the private key to ssh onto the newly launched machine and configure the instance.

To launch the application, you'll need to have Vagrant installed. Run `vagrant up`.  This will configure the server to run on port 3000 and start the Delayed Job queue.  It should be accessable at: http://10.10.10.10:8080.

It's a very simple application.  Clicking 'New Server' will let you create a new server.  You'll need to add a name and select a