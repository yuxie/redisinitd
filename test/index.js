const db = require('redis').createClient('/tmp/redis.sock')
db.on('error', (e) => console.log('major error event:\n', e))

db.get('yo::brah', (err, reply)=> {
  if (!reply)
    return bgsave()
  console.log(reply)
})

// test bgsave stuff
function bgsave(){
  db.set('yo::brah', 'ayyyyeeeeee', (err, reply) => {
    if (err) throw err
    db.get('yo::brah', (err, reply) => {
      if (err) throw err; console.log(reply)
      db.BGSAVE((err, reply) => {
        if (err) throw err; console.log(reply)
      })
    })
  })
}
