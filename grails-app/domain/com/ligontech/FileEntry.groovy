package com.ligontech

class FileEntry {
      String name;
      String fileName;
      String contentType;
      String extension;
      String path;
      String size;
      Date dateCreated
      Date lastUpdated
      static constraints = {
            name(nullable: false,blank: false)
            fileName(nullable: false,blank: false)
            path(nullable: false,blank: false)
            extension(nullable: false,blank: false)
            contentType(nullable: true,blank: true)
      }
      public Documents convertToDocuments(){
            Documents doc=new Documents();
            doc.properties=this.properties;
            return doc;
      }
}
