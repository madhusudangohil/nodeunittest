const SessionRepo = require('./sessionRepository');

class Sms {
    constructor(){
        this.sessionRepo = new SessionRepo();
    }

    handleSession(phoneNumber){
        return this.sessionRepo.findByPhoneNumber(phoneNumber)
                               .then(r => {
                                   console.log(r);
                                   return Promise.resolve(r);
                               })
                               
    }
}

module.exports = Sms;