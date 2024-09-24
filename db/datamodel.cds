namespace sumit;
using { cuid,managed } from '@sap/cds/common';


type data{
    kind:Int16;
    fName:String;
    lNAme:String;

};

type attachmentT: String @assert.range enum {
    PAN_CARD='PAN';
    GSTIN='GST';

};
entity student{
    key ID:String;
    name:String;
    attachments:Association to many Files on attachments.student=$self;

};
entity Files: cuid, managed{
    student:Association to student;
    @Core.MediaType: mediaType
    content: LargeBinary;
    @Core.IsMediaType: true
    mediaType: String;
    fileName: String;
    size: Integer;
    url: String;
    DocTypeID: attachmentT;
};
entity Emp  {
    key ID:UUID;
    CHECK_NAME:String;
    TYPE_NAME:data;
    OTHER_TYPE_NAME:data; 
    
};

entity worker {
    key ID:String;
    Name:String;
    address:Association to many address on address.owner=$self

};
entity address{
    key ID:String;
    owner:Association to worker;
    address1:String;
    address2:String;

}