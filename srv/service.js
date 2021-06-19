const cds = require('@sap/cds')
module.exports = function (){
this.after('READ','account', each => {
    each.balance = 100;
});

this.on ('submitTransaction', (req)=>{ });

};