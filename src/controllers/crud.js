const conexion = require('../database/db');


exports.login = (req,res)=>{
    const email = req.body.email;
    const pass = req.body.password;

    if(email && pass){
        conexion.query('SELECT * FROM usuario WHERE correo = ? and pass = ? and estado_usuario_id_fk  = 1', [email, pass], (error, results)=>{
            if(error){
                console.log('error :>> ', error);
            }else{
                if(results.length > 0){
                    res.render('login',{
                        alert:true,
                        alertTitle: 'Conexion exitosa',
                        alertMessage: 'Bienvenido!',
                        alertIcon:'succes',
                        showConfirmButton: false,
                        timer: 1500,
                        ruta: 'categoria'
                    })
                
                }else{

                    //NO ENTRA
                    res.render('login',{
                        alert:true,
                        alertTitle: 'Error',
                        alertMessage: 'Nombre o contraseña incorrectos!',
                        alertIcon:'error',
                        showConfirmButton: true,
                        timer: false,
                        ruta: 'login'
                    })
                }
            }
        })
    }
}

exports.saveUser =(req, res) => {
    const nombre = req.body.name;
    const apellido = req.body.apellido;
    const correo = req.body.correo;
    const pass = req.body.password;
    const tipo_user = 3;
    conexion.query('INSERT INTO usuario SET ?', { nombre: nombre, correo: correo, pass: pass, tipoUsuario_id_fk: tipo_user, estadoUsuario_id_fk:1 },(error, results) => {
        if (error) {
            throw error;

        } else {
            res.render('registro', {
                alert: true,
                alertTitle: 'Resgistro',
                alertMessage: 'Registro exitoso!',
                alertIcon: 'success',
                showConfirmButton: false,
                timer: 1500,
                ruta: ''
            })
        }
    });
}
