const expect = require('chai').expect;
const sms = new(require('../sms'))();
const sinon = require('sinon');
const SessionRepo = require('../sessionRepository');

describe("Sms", function(){
    describe("handleSession", function(){   
    it("should return a sesison object", function(){           
        let sessionMock = sinon.mock(SessionRepo.prototype);
        sessionMock.expects("findByPhoneNumber")
                    .once()
                    .withArgs("6144489143")
                    .returns(Promise.resolve({id: 100, name: 'MockClient1'}));

            return sms.handleSession("6144489143")
                        .then(r => {
                            console.log(r);
                            expect(r.id).to.be.equal(100);
                            sessionMock.verify();
                            sessionMock.restore();
                        });
            
        });

         it("should return an error string when session not present", function(){
             let sessionMock = sinon.mock(SessionRepo.prototype);
             sessionMock.expects("findByPhoneNumber")
                    .once()
                    .withArgs(sinon.match.any)
                    .returns(Promise.reject("not found from mock"));

            return sms.handleSession("1112223333")
                        .catch(e => {
                            console.log(e);
                            expect(e).to.be.equal("not found from mock");
                            sessionMock.verify();
                            sessionMock.restore();
                        });
            
        });

        it("should return a sesison object", function(){
           
            return sms.handleSession("3097501417")
                        .then(r => {
                            console.log(r);
                            expect(r.id).to.be.equal(100);
                        });
            
        });

         it("should return an error string when session not present", function(){
           
            return sms.handleSession("1112223333")
                        .catch(e => {
                            console.log(e);
                            expect(e).to.be.equal("not found");
                        });
            
        });

    });

});
