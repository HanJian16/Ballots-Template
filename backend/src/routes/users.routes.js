import { Router } from 'express';

const router = Router();

router.get('/users', (req, res) => {
  res.send('obteniendo usuarios');
});

router.get('/users/:id', (req, res) => {
  const userId = req.params.id;
  res.send('obteniendo usuario ' + userId);
});

router.post('/users', (req, res) => {
  res.send('creando usuario');
});

router.put('/users/:id', (req, res) => {
  const userId = req.params.id;
  res.send('actualizando usuario ' + userId);
});

router.delete('/users/:id', (req, res) => {
  const userId = req.params.id;
  res.send('eliminando usuario ' + userId);
});

export default router;