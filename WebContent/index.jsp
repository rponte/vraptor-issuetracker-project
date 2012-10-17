<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta name="author" content="Aalaap Ghag" />
    <title>Twitter&rsquo;s Bootstrap with Ryan Fait&rsquo;s Sticky Footer and Aalaap Ghag&rsquo;s Responsive Padding Fix</title>
    <link rel="stylesheet" href="/vraptor-issuetracker/css/bootstrap.min.css" />
    <link href="css/bootstrap-responsive.css" rel="stylesheet">
    <style>
        html, body {
            height: 100%;
        }
        footer {
            color: #666;
            background: #222;
            padding: 17px 0 18px 0;
            border-top: 1px solid #000;    
        }
        footer a {
            color: #999;
        }
        footer a:hover {
            color: #efefef;
        }
        .wrapper {
            min-height: 100%;
            height: auto !important;
            height: 100%;
            margin: 0 auto -63px;
        }
        .push {
            height: 63px;
        }
        /* not required for sticky footer; just pushes hero down a bit */
        .wrapper > .container {
            padding-top: 60px;
        }

        /* responsive footer fix by Aalaap Ghag */
        @media (max-width: 767px) {
            body {
                padding-right: 0px;
                padding-left: 0px;
            }
    
            footer, .wrapper {
                padding-left: 20px;
                padding-right: 20px;
            }
        }

        .container {
            max-width: 940px;
        }
        /* end responsive footer fix */
    </style>

  </head>
  <body>
    
    <div class="wrapper">
      <div class="container">
        <header class="hero-unit">
          <h1>Twitter&rsquo;s Bootstrap with Ryan Fait&rsquo;s Sticky Footer and Aalaap Ghag&rsquo;s Responsive Padding Fix</h1>
          <p>It's really <strong>not</strong> that hard, y&rsquo;know. Check out the source code and <abbr title="Cascading Style Sheets">CSS</abbr> of this web page for how to do it yourself.</p>
        </header>
      </div>
      <div class="push"><!--//--></div>
    </div> <!-- .wrapper -->

    <footer>
      <div class="container">
        <p>Put together in less than five minutes by <a href="http://www.martinbean.co.uk/" rel="author">Martin Bean</a>. Uses <a href="http://twitter.github.com/bootstrap/" rel="external">Twitter Bootstrap</a> and <a href="http://ryanfait.com/sticky-footer/" rel="external">Ryan Fait&rsquo;s Sticky Footer</a> and <a href="#">Aalaap Ghag&rsquo;s Responsive Padding Fix</a>.</p>
      </div>
    </footer>

  </body>
</html>
