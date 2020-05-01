
var soap = require('soap');
var fs = require('fs')
var url = 'https://ofsted-feed.herokuapp.com/wsdl?wsdl';

// Create client
soap.createClient(url, function (err, client) {
  if (err){
    throw err;
  }
  /* 
  * Parameters of the service call: they need to be called as specified
  * in the WSDL file
  */
  var args = {
    loginName: "Acouncil",
    lACode: "AAA"
  };
  // var args = fs.readFileSync("soap/OfstedChildcareRegisterLocalAuthorityExtract-v1-3-example.xml")
  // call the service
  client.GetChildcareExtractForLA(args, function (err, res) {
    if (err)
      console.log(err)
      //throw err;
      // print the service returned result
    else
      console.log(res); 
    // GetChildcareExtractForLAResult: 1,
    // xMLExtract: "testing"
  });
});