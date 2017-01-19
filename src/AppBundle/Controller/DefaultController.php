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
        $em = $this->getDoctrine()
            ->getRepository('ApplicationSonataMediaBundle:Media');
        $images = $em->createQueryBuilder('p')
            ->select('p.description, p.id')
            ->orderBy('p.createdAt', 'DESC')
            ->getQuery();

        $paginator  = $this->get('knp_paginator');
        $pagination = $paginator->paginate(
            $images,
            $this->get('request')->query->get('page', 1),
            12 /*limit per page*/
        );

        // parameters to template
        return $this->render('AppBundle::gallery.html.twig', array('pagination' => $pagination));
    }
}
