# README

A small app to generate signature and timestamp for Walmart API.
Application has following skeleton:

* Walmart Signature generation is done

* A dummy API skeleton is created to cater API requests to different stores. Code can be implemeted further

* Spec definitions added, need inmplementation

* Ruby 2.7.1, Rails 5.2
* Used HttParty to make API calls

Observations

* Technically the private key generated is not PEM because it doesnt contain the header and footer.

* Used openssl_pkcs8_pure to generate PKCS8 signature.
