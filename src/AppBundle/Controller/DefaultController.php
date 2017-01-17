<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

class DefaultController extends Controller
{
    /**
     * @Route("/", name="homepage")
     */
    public function indexAction(Request $request)
    {
        return $this->render('AppBundle::index.html.twig');
    }

    /**
     * {@inheritdoc}
     * @Route("/view", name="view_gallery")
     */
    public function listAction(Request $request = null)
    {
        $repository = $this->getDoctrine()
            ->getRepository('ApplicationSonataMediaBundle:Media');
        $query = $repository->createQueryBuilder('p')
            ->select('p.providerReference')
            ->select('p.description, p.id')
            ->orderBy('p.createdAt', 'DESC')
            ->getQuery();
        $data = $query->getResult();

        foreach ($data as $key => $value) {
            $correct_data[$key] = array(
                'id' => 'uploads/media/default/0001/01/thumb_' . $value['id'] . '_admin.jpeg',
                'description' => $value['description'],
            );
        }

        return $this->render('AppBundle::gallery.html.twig', array(
            'data' => $correct_data
        ));
    }
}
