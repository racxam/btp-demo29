module.exports = async function () {
    const {studentSrv} = this.entities;
    this.before('CREATE', 'Files', req => {
        console.log('Create called')
        console.log(JSON.stringify(req.data))
        req.data.url = `/odata/v4/attachments/Files(${req.data.ID})/content`;
    });

    this.on('getAttachmentsForStudent',async(req,res)=>{
        var results = [];
        results= await cds.tx(req).run(SELECT.from(studentSrv,(a=>{
               a.attachments(b=>{
                b.fileName, b.url
               })
        })).where({
            "ID":"1"
        }) ) ;
        console.log(results);
        return results;
    })
}