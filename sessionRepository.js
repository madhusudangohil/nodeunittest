class SessionRepository {
    constructor(){

    }
    findByPhoneNumber(phoneNumber){
        let promise = new Promise(function(resolve, reject){
            setTimeout(function() {
                if(phoneNumber === '3097501417')
                    resolve({id: 100, name: 'Client1'});
                else
                    reject('not found');
            }, 5000);
        });
        return promise;        
    }
}

module.exports = SessionRepository;