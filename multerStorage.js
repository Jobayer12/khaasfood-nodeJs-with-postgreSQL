// var storage = multer.diskStorage({
//     destination: (req, file, cb) => {
//       cb(null, 'data/img')
//     },
//     filename: (req, file, cb) => {
//       cb(null,Date.now() + path.extname(file.originalname));
//     }
// });
// var upload = multer({storage: storage});


// app.post('/upload/categories',upload.single('image'),(req,res)=>{
  
//   const name='fruits';
//   const title='FRUITS';
//   const image=req.file.filename;

//   pool
//     .query(
//       `INSERT INTO public.categories(name, title, image) values ('${name}', '${title}', '${image}');`
//     )
//     .then(() => {
//       res.status(200).json({
//         message: "data inserted"
//       });
//     })
//     .catch(err => {
//       res.status(404).json(err);
//     });
  
// })