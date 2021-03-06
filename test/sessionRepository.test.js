const expect = require('chai').expect;
const sessionRepo = new(require('../sessionRepository'))();

describe("sessionRepository", function(){
    describe("findByPhoneNumber", function(){
        it("should return a sesison object", function(){          
            return sessionRepo.findByPhoneNumber("3097501417")
                        .then(r => {
                            console.log(r);
                            expect(r.id).to.be.equal(100);
                        });
            
        });

         it("should return an error string when session not present", function(){           
            return sessionRepo.findByPhoneNumber("1112223333")
                        .catch(e => {
                            console.log(e);
                            expect(e).to.be.equal("not found");
                        });
            
        });
    });

});
