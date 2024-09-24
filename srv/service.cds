using {sumit} from '../db/datamodel';



service Attachments {
    
entity EmpSrv as projection on sumit.Emp;
entity workerSrv as projection on sumit.worker;
entity addressSrv as projection on sumit.address;
entity Files as projection on sumit.Files;
entity studentSrv as projection on sumit.student;
action getAttachmentsForStudent() returns array of Files;

}