const cds = require('@sap/cds')
module.exports = function() {

    this.after('READ', 'account', each => {
        each.balance = 100;
    });

    // this.on('READ', 'Attachments', (req,next)=>{
    //     console.log(req.data.ID);
    //     // return  cds.read('Attachments', {ID: req.data.ID})
    // });

    this.after('READ', 'Attachments', each => {
        debugger;   
        console.log(each.ID);
        console.log('read attachment');
        each.content = 'data:'+each.mediaType+';base64,'+each.content;
        //console.log(each.content);
    });

    this.on('post_transaction', (req) => {

    });

    this.on('void_transaction', (req)=>{
        debugger;
    });

    this.before('*', (req)=>{
        // console.info('this is done.');
    });

};