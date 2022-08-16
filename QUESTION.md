.1 OWASP --->

 Open Web Application Security Project :- It is the community whic provide some Open Source technology, tool and documentation for secure webapplication from attack. The all tool provide by this project is completely free and open source.


 2. SSL Pining :- This is the ceritificate we add with the network request to validate client request at server side.
 This certificate keep safe network communication safe from Mand In The Middle (MITM)Attack.

 It is recommended by the OWASP.

 3. Handshake:- It is the signial/message which basically used for authenticate and coordinate between Program/(client Server)

 4. Handshake Exception :- It is Handshake error in client and server.
                           This is the CERTIFICATE_VERIFY_FAILED :

 5. CERTIFICATE_VERIFY_FAILED ?
                            Unable to get local issuer certificate. (Server not getting certificate which share previously to clent for make communication with them); Handshake.cc:363                        

6. SSL Pining :- In flutter we used SecurityContext Class for SSL Pining.
                 1. This class used  PEM(Privacy Enable Message) for Certificate 
                2. PFX /P12 /PKCS12 :- For sercurity Public and privte key transition


7. How many way to add certificate:

                A. SecurityContext.setTrustedCertificatesBytes
                B. HttpClient.badCertificateCallback
                C. ssl_pinning_plugin  dependancy


8. How we get certificate of website
 
 OpenWebPage -> ctr+shrift +j -> security -> viewCertificate -> export certificate 

 Note:- exported certifcate extension is xxx.cer change it to .pem by openssl command

 //openssl x509 -inform der -in demo.cer -out demo.pem



 9. Limitation of SSL Pining:-

  1. Not work well when our application using multiple domain pages redirection.
  2. Application need to relaunch on play store once our certificate expire. In case we have no UI and logical change in app.

