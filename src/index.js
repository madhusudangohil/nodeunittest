const sms = new(require('./sms'))();
const SessionRepo = require('./sessionRepository');


module.exports.handler = (event, context, callback) => {
     return sms.handleSession("3097501417")
                        .then(r => {                           
                            callback(null, r.id);
                        });
}