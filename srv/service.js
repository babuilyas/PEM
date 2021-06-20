const cds = require('@sap/cds')
module.exports = function () {

    this.after('READ', 'account', each => {
        each.balance = 100;
    });

    this.on('post_transaction', (req) => {

    });

    this.on('void_transaction', (req)=>{
        debugger;
    });

    this.before('*', (req)=>{
        console.info('this is done.');
    });

};