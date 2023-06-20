const PORT =8080;
const bodyParser = require('body-parser');
const express = require('express');
const app = express()
app.use(bodyParser.json());
const {PrismaClient} = require('@prisma/client')
const prisma =new PrismaClient();

const authorRoutes = require('./routes/authors');
const albumRoutes = require('./routes/albums');
const songRoutes = require('./routes/songs');


app.use(bodyParser.json());

app.use(authorRoutes);

app.use(albumRoutes);

app.use(songRoutes);


app.post('/author',async(req, res, next)=>{
    const author= await prisma.author.create({
    
    })
        res.status(201).json({
        author
    })
})
app.get('/authors',async(req, res, next)=>{
    const authors = await prisma.author.findMany({
    
    });
    res.status(200).json({
        authors
    })
})


app.patch("/album/:id", async (req, res, next) => {
  const albums = await prisma.albums.update({
    
  });
  res.status(200).json({
    albums,
  });
});
app.get("/albums", async (req, res, next) => {
  const albums = await prisma.albums.findMany({

  });
  res.status(200).json({
    albums,
  });
});


app.delete("/album/:id", async (req, res, next) => {
  const albums = await prisma.albums.findMany({

  });
  res.status(200).json({
    albums,
  });
});


app.post("/songs", async (req, res, next) => {
  const song = await prisma.songs.create({
    data,
  });

  res.status(201).json({
    song,
  });
});




app.listen(PORT, () =>{
    console.log(`server is running on port ${PORT}`);
})