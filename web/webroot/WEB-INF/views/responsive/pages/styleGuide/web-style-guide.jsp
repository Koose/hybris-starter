<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template"%>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags"%>

<template:page pageTitle="${pageTitle}">
    <div id="mobile-wrap">
        <div id="content" class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="sidebar col-md-3" role="complementary">
                        <aside class="gor-mobile-accordion">
                            <h3 class="accordion-header visible-md">Pages</h3>
                            <div class="accordion-content">
                                <div class="accordion-content-inner">
                                    <ul>
                                        <li>
                                            <a class="scrollable" href="#typography">Typography</a>
                                        </li>

                                        <li>
                                            <a class="scrollable" href="#iconography">Iconography</a>
                                        </li>

                                        <li>
                                            <a class="scrollable" href="#messages">Messages</a>
                                        </li>

                                        <li>
                                            <a class="scrollable" href="#forms">Forms</a>
                                        </li>

                                        <li>
                                            <a class="scrollable" href="#buttons">Buttons</a>
                                        </li>

                                        <li>
                                            <a class="scrollable" href="#grid">Grid</a>
                                        </li>

                                        <li>
                                            <a class="scrollable" href="#tables">Tables</a>
                                        </li>

                                        <li>
                                            <a class="scrollable" href="#pagination">Pagination</a>
                                        </li>

                                        <li>
                                            <a class="scrollable" href="#responsive-embeds">Responsive Embeds</a>
                                        </li>

                                        <li>
                                            <a class="scrollable" href="#modals">Modals</a>
                                        </li>
                                        <li>
                                            <a class="scrollable" href="#dropdown">dropdown</a>
                                        </li>
                                        <li>
                                            <a class="scrollable" href="#accordion">accordion</a>
                                        </li>
                                        <li>
                                            <a class="scrollable" href="#tabs">tabs</a>
                                        </li>

                                    </ul>
                                </div>
                            </div>
                        </aside>
                    </div>
                    <div class="main col-md-9 col-md-push-3" role="main">
                        <section id="typography" class="section">
                            <h2 class="legend">Typography</h2>
                            <h3>Headings</h3>
                            <p class="section-info">All heading styles from h1 through h6. To use you can <code>&amp;:extend(h1)</code> through <code>&amp;:extend(h6)</code> or apply <code>.h1</code> through <code>.h6</code></p>

                            <h1>h1 Heading Level 1</h1>
                            <h2>h2 Heading Level 2</h2>
                            <h3>h3 Heading Level 3</h3>
                            <h4>h4 Heading Level 4</h4>
                            <h5>h5 Heading Level 5</h5>
                            <h6>h6 Heading Level 6</h6>


                            <br>
                            <h3>Standard Copy</h3>
                            <p class="section-info">All standard paragraphy info and styling including strong, bold, italic and emphasis.</p>
                            <p>
                                A paragraph (from the Greek paragraphos, "to write beside" or "written beside") is a self-contained unit of a discourse in writing dealing with a
                                particular point or idea. A <i>paragraph</i> consists of one or more sentences. Though not required <em>by the syntax of any</em> language, paragraphs are usually
                                an expected part of formal writing, used to organize longer prose.
                            </p>
                            <p>
                                A paragraph (from the Greek paragraphos, "to write beside" or "written beside") is a self-contained unit of a discourse in writing dealing with a
                                particular point or idea. A <b>paragraph</b> consists of one or more sentences. Though not required <strong>by the syntax of any</strong> language, paragraphs are usually
                                an expected part of formal writing, used to organize longer prose.
                            </p>
                            <p>
                                A paragraph (from the Greek paragraphos, "to write beside" or "written beside") is a self-contained unit of a discourse in writing
                                dealing with a particular point or idea. A <a href="http://en.wikipedia.org/wiki/Paragraph" target="_blank">paragraph</a> consists of
                                one or more sentences. Though not required by the syntax of any language, paragraphs are usually an expected part of formal writing, used to organize longer prose.
                            </p>

                            <br>
                            <h3>Lists</h3>
                            <p class="section-info">All standard lists follow browser defaults. There is a <code>.reset-list</code> helper class to remove the bullets and numerals if needed.</p>
                            <ul>
                                <li>This is a list item in an unordered list</li>
                                <li>An unordered list is a list in which the sequence of items is not important. Sometimes, an unordered list is a bulleted list. And this is a long list item in an unordered list that can wrap onto a new line.</li>
                                <li>
                                    Lists can be nested inside of each other
                                    <ul>
                                        <li>This is a nested list item</li>
                                        <li>This is another nested list item in an unordered list</li>
                                    </ul>
                                </li>
                                <li>This is the last list item</li>
                            </ul>


                            <ul class="reset-list">
                                <li>This is a clean list with no styles <code>ul.reset-list</code></li>
                                <li>This is a clean list with no styles #2</li>
                            </ul>


                            <ol>
                                <li>This is a list item in an ordered list</li>
                                <li>An ordered list is a list in which the sequence of items is important. An ordered list does not necessarily contain sequence characters.</li>
                                <li>
                                    Lists can be nested inside of each other
                                    <ol>
                                        <li>This is a nested list item</li>
                                        <li>This is another nested list item in an ordered list</li>
                                    </ol>
                                </li>
                                <li>This is the last list item</li>
                            </ol>

                        </section>

                        <hr/>

                        <section id="colors">
                            <div class="row">
                                <div class="col">
                                    <div class="box box--color-black" style="background-color:#000;padding:30px"></div>
                                    <p>Black<br> #000000</p>
                                </div>
                                <div class="col">
                                    <div class="box box--color-dark-gray" style="background-color:#454545;padding:30px"></div>
                                    <p>Dark Gray<br> #454545</p>
                                </div>
                                <div class="col">
                                    <div class="box box--color-gray" style="background-color:#8B8B8B;padding:30px"></div>
                                    <p>Gray<br> #8B8B8B</p>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <div class="box box--color-light-gray"  style="background-color:#9B9B9B;padding:30px"></div>
                                    <p>Light Gray<br> #9B9B9B</p>
                                </div>
                                <div class="col">
                                    <div class="box box--color-pale-gray" style="background-color:#BFBFBF;padding:30px"></div>
                                    <p>Light Gray<br> #BFBFBF</p>
                                </div>
                                <div class="col">
                                    <div class="box box--color-pale-gray" style="background-color:#EFEFEF;padding:30px"></div>
                                    <p>ULTRA LIGHT GRAY<br> #EFEFEF</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="box box--color-light-gray" style="background-color:#232323;padding:30px"></div>
                                    <p>FOOTER GRAYS DARK<br> #232323</p>
                                </div>
                                <div class="col">
                                    <div class="box box--color-pale-gray" style="background-color:#2E2E2E;padding:30px"></div>
                                    <p>FOOTER GRAYS LIGHT<br> #2E2E2E</p>
                                </div>

                                <div class="col">
                                    <div class="box box--color-blue" style="background-color:#2266BB;padding:30px"></div>
                                    <p>Blue<br> #2266BB</p>
                                </div>
                            </div>
                        </section>
                        <hr/>

                        <section id="iconography" class="section">
                            <h2 class="legend">Iconography</h2>
                            <div class="grid-container">
                                <h4>Misc</h4>
                                <div class="row">
                                    <div class="col-md-3">
                                        <i class="icon-heart-filled"></i><code>.icon-heart-filled</code>
                                    </div>
                                    <div class="col-md-3">
                                        <i class="icon-paintcan"></i><code>.icon-paintcan</code>
                                    </div>
                                    <div class="col-md-3">
                                        <i class="icon-layers"></i><code>.icon-layers</code>
                                    </div>
                                    <div class="col-md-3">
                                        <i class="icon-epa"></i><code>.icon-epa</code>
                                    </div>
                                    <div class="col-md-3">
                                        <i class="icon-download"></i><code>.icon-download</code>
                                    </div>
                                    <div class="col-md-3">
                                        <i class="icon-notice"></i><code>.icon-notice</code>
                                    </div>
                                    <div class="col-md-3">
                                        <i class="icon-user"></i><code>.icon-user</code>
                                    </div>
                                    <div class="col-md-3">
                                        <i class="icon-user-filled"></i><code>.icon-user-filled</code>
                                    </div>
                                    <div class="col-md-3">
                                        <i class="icon-paper"></i><code>.icon-paper</code>
                                    </div>
                                    <div class="col-md-3">
                                        <i class="icon-tips"></i><code>.icon-tips</code>
                                    </div>
                                    <div class="col-md-3">
                                        <i class="icon-paper-plus"></i><code>.icon-paper-plus</code>
                                    </div>
                                    <div class="col-md-3">
                                        <i class="icon-sheets"></i><code>.icon-sheets</code>
                                    </div>
                                    <div class="col-md-3">
                                        <i class="icon-specs"></i><code>.icon-specs</code>
                                    </div>
                                    <div class="col-md-3">
                                        <span class="icon-scrolltab"></span><code>.icon-scrolltab</code>
                                    </div>
                                    <div class="col-md-3">
                                        <span class="icon-certifications"></span><code>.icon-certifications</code>
                                    </div>
                                    <div class="col-md-3">
                                        <span class="icon-add-box"></span><code>.icon-add-box</code>
                                    </div>
                                    <div class="col-md-3">
                                        <span class="icon-heart-plus"></span><code>.icon-heart-plus</code>
                                    </div>
                                    <div class="col-md-3">
                                        <span class="icon-pad"></span><code>.icon-pad</code>
                                    </div>
                                    <div class="col-md-3">
                                        <span class="icon-article"></span><code>.icon-article</code>
                                    </div>
                                    <div class="col-md-3">
                                        <span class="icon-bmc-logo"></span><code>.icon-bmc-logo</code>
                                    </div>
                                    <div class="col-md-3">
                                        <span class="icon-sample"></span><code>.icon-sample</code>
                                    </div>
                                    <div class="col-md-3">
                                        <span class="icon-cart"></span><code>.icon-cart</code>
                                    </div>
                                    <div class="col-md-3">
                                        <span class="icon-checkbox"></span><code>.icon-checkbox</code>
                                    </div>
                                    <div class="col-md-3">
                                        <span class="icon-checkmark-thin"></span><code>.icon-checkmark-thin</code>
                                    </div>
                                    <div class="col-md-3">
                                        <span class="icon-checkmark"></span><code>.icon-checkmark</code>
                                    </div>
                                    <div class="col-md-3">
                                        <span class="icon-close"></span><code>.icon-close</code>
                                    </div>
                                    <div class="col-md-3">
                                        <span class="icon-delete"></span><code>.icon-delete</code>
                                    </div>
                                    <div class="col-md-3">
                                        <span class="icon-download-box"></span><code>.icon-download-box</code>
                                    </div>
                                    <div class="col-md-3">
                                        <span class="icon-edit-box"></span><code>.icon-edit-box</code>
                                    </div>
                                    <div class="col-md-3">
                                        <span class="icon-edit"></span><code>.icon-edit</code>
                                    </div>
                                    <div class="col-md-3">
                                        <span class="icon-email"></span><code>.icon-email</code>
                                    </div>
                                    <div class="col-md-3">
                                        <span class="icon-embed"></span><code>.icon-embed</code>
                                    </div>

                                    <div class="col-md-3">
                                        <span class="icon-heart"></span><code>.icon-heart</code>
                                    </div>
                                    <div class="col-md-3">
                                        <span class="icon-puzzle"></span><code>.icon-puzzle</code>
                                    </div>

                                    <div class="col-md-3">
                                        <span class="icon-grid"></span><code>.icon-grid</code>
                                    </div>

                                    <div class="col-md-3">
                                        <span class="icon-info"></span><code>.icon-info</code>
                                    </div>

                                    <div class="col-md-3">
                                        <span class="icon-linkout"></span><code>.icon-linkout</code>
                                    </div>
                                    <div class="col-md-3">
                                        <span class="icon-list"></span><code>.icon-list</code>
                                    </div>
                                    <div class="col-md-3">
                                        <span class="icon-location"></span><code>.icon-location</code>
                                    </div>
                                    <div class="col-md-3">
                                        <span class="icon-marker"></span><code>.icon-marker</code>
                                    </div>
                                    <div class="col-md-3">
                                        <span class="icon-palette"></span><code>.icon-palette</code>
                                    </div>
                                    <div class="col-md-3">
                                        <span class="icon-pdf"></span><code>.icon-pdf</code>
                                    </div>

                                    <div class="col-md-3">
                                        <span class="icon-play"></span><code>.icon-play</code>
                                    </div>
                                    <div class="col-md-3">
                                        <span class="icon-print"></span><code>.icon-print</code>
                                    </div>
                                    <div class="col-md-3">
                                        <span class="icon-radio"></span><code>.icon-radio</code>
                                    </div>
                                    <div class="col-md-3">
                                        <span class="icon-picture"></span><code>.icon-picture</code>
                                    </div>
                                    <div class="col-md-3">
                                        <span class="icon-search-box"></span><code>.icon-search-box</code>
                                    </div>
                                    <div class="col-md-3">
                                        <span class="icon-search"></span><code>.icon-search</code>
                                    </div>
                                    <div class="col-md-3">
                                        <span class="icon-door"></span><code>.icon-door</code>
                                    </div>
                                    <div class="col-md-3">
                                        <span class="icon-sun"></span><code>.icon-sun</code>
                                    </div>
                                    <div class="col-md-3">
                                        <span class="icon-share-box"></span><code>.icon-share-box</code>
                                    </div>
                                    <div class="col-md-3">
                                        <span class="icon-share"></span><code>.icon-share</code>
                                    </div>
                                    <div class="col-md-3">
                                        <span class="icon-similar"></span><code>.icon-similar</code>
                                    </div>

                                </div>

                                <br>
                                <h4>Arrow/Angle Indicators</h4>
                                <div class="row">
                                    <div class="col-md-3">
                                        <i class="icon-up"></i><code>.icon-up</code>
                                    </div>
                                    <div class="col-md-3">
                                        <i class="icon-arrow-down"></i><code>.icon-arrow-down</code>
                                    </div>
                                    <div class="col-md-3">
                                        <i class="icon-arrow-left"></i><code>.icon-arrow-left</code>
                                    </div>
                                    <div class="col-md-3">
                                        <i class="icon-arrow-right"></i><code>.icon-arrow-right</code>
                                    </div>
                                    <div class="col-md-3">
                                        <i class="icon-arrow-up"></i><code>.icon-arrow-up</code>
                                    </div>
                                    <div class="col-md-3">
                                        <span class="icon-houzz"></span><code>.icon-houzz</code>
                                    </div>
                                    <div class="col-md-3">
                                        <span class="icon-houzz-sqr"></span><code>.icon-houzz-sqr</code>
                                    </div>

                                </div>

                                <br>
                                <h4>Social</h4>
                                <div class="row">
                                    <div class="col-md-3">
                                        <span class="icon-facebook"></span><code>.icon-facebook</code>
                                    </div>
                                    <div class="col-md-3">
                                        <span class="icon-facebook-sqr"></span><code>.icon-facebook-sqr</code>
                                    </div>
                                    <div class="col-md-3">
                                        <span class="icon-instagram"></span><code>.icon-instagram</code>
                                    </div>
                                    <div class="col-md-3">
                                        <span class="icon-instagram-sqr"></span><code>.icon-instagram-sqr</code>
                                    </div>
                                    <div class="col-md-3">
                                        <span class="icon-twitter"></span><code>.icon-twitter</code>
                                    </div>
                                    <div class="col-md-3">
                                        <span class="icon-twitter-sqr"></span><code>.icon-twitter-sqr</code>
                                    </div>
                                    <div class="col-md-3">
                                        <span class="icon-youtube"></span><code>.icon-youtube</code>
                                    </div>
                                    <div class="col-md-3">
                                        <span class="icon-youtube-sqr"></span><code>.icon-youtube-sqr</code>
                                    </div>
                                    <div class="col-md-3">
                                        <span class="icon-pinterest"></span><code>.icon-pinterest</code>
                                    </div>
                                    <div class="col-md-3">
                                        <span class="icon-pinterest-sqr"></span><code>.icon-pinterest-sqr</code>
                                    </div>
                                    <div class="col-md-3">
                                        <span class="icon-gplus"></span><code>.icon-gplus</code>
                                    </div>
                                    <div class="col-md-3">
                                        <span class="icon-gplus-sqr"></span><code>.icon-gplus-sqr</code>
                                    </div>
                                </div>

                                <br>
                                <h4>Credit Cards</h4>
                                <div class="row">
                                    <div class="col-md-3">
                                        <i class="icon-cc-visa"></i><code>.icon-cc-visa</code>
                                    </div>
                                    <div class="col-md-3">
                                        <i class="icon-cc-mastercard"></i><code>.icon-cc-mastercard</code>
                                    </div>
                                    <div class="col-md-3">
                                        <i class="icon-cc-discover"></i><code>.icon-cc-discover</code>
                                    </div>
                                    <div class="col-md-3">
                                        <i class="icon-cc-amex"></i><code>.icon-cc-amex</code>
                                    </div>
                                    <div class="col-md-3">
                                        <i class="icon-cc-paypal"></i><code>.icon-cc-paypal</code>
                                    </div>
                                </div>
                            </div>
                        </section>

                        <hr/>

                        <section id="messages" class="section">
                            <h2 class="legend">Messages</h2>

                            <div class="alert alert-primary" role="alert">
                                This is a primary alert-check it out!
                            </div>
                            <div class="alert alert-secondary" role="alert">
                                This is a secondary alert-check it out!
                            </div>
                            <div class="alert alert-success" role="alert">
                                This is a success alert-check it out!
                            </div>
                            <div class="alert alert-danger" role="alert">
                                This is a danger alert-check it out!
                            </div>
                            <div class="alert alert-warning" role="alert">
                                This is a warning alert-check it out!
                            </div>
                            <div class="alert alert-info" role="alert">
                                This is a info alert-check it out!
                            </div>
                            <div class="alert alert-light" role="alert">
                                This is a light alert-check it out!
                            </div>
                            <div class="alert alert-dark" role="alert">
                                This is a dark alert-check it out!
                            </div>

                            <div class="alert alert-danger" role="alert">
                                This is a danger alert with <a href="#" class="alert-link">an example link</a>. Give it a click if you like.
                            </div>

                            <div class="alert alert-warning alert-dismissible fade show" role="alert">
                                <strong>Holy guacamole!</strong> You should check in on some of those fields below.
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span class="icon-close" aria-hidden="true"></span>
                                </button>
                            </div>

                        </section>

                        <hr/>

                        <section id="forms" class="section">
                            <h2 class="legend">Forms</h2>
                            <h3>Basic Example</h3>
                            <p>Individual form controls automatically receive some global styling. All text based input, textarea, and select elements are set to width: 100%; by default.  Labels and Placeholders are visible by default. Add the <code>.sr-only</code> helper class to labels that you don't want to display.</p>
                            <form>
                                <div class="form-group">
                                    <label for="exampleFormControlInput1">Email address</label>
                                    <input type="email" class="form-control" id="exampleFormControlInput1" placeholder="name@example.com">
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlSelect1">Example select</label>
                                    <div class="select-wrapper">
                                        <select class="form-control" id="exampleFormControlSelect1">
                                            <option>1</option>
                                            <option>2</option>
                                            <option>3</option>
                                            <option>4</option>
                                            <option>5</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="form-inline">
                                        <div class="form-group mb-2">
                                            <input type="text" class="form-control" placeholder="Search for...">
                                        </div>
                                        <button class="btn icon-search mb-2" type="submit"></button>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlSelect2">Example multiple select</label>
                                    <select multiple class="form-control" id="exampleFormControlSelect2">
                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                        <option>4</option>
                                        <option>5</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlTextarea1">Example textarea</label>
                                    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                                </div>
                            </form>

                            <br>
                            <h3>Inline Form</h3>
                            <br/>
                            <form class="form-inline">
                                <label class="sr-only" for="inlineFormInputName2">Name</label>
                                <input type="text" class="form-control mb-2 mr-sm-2" id="inlineFormInputName2" placeholder="Jane Doe">

                                <label class="sr-only" for="inlineFormInputGroupUsername2">Username</label>
                                <div class="input-group mb-2 mr-sm-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">@</div>
                                    </div>
                                    <input type="text" class="form-control" id="inlineFormInputGroupUsername2" placeholder="Username">
                                </div>

                                <div class="form-check mb-2 mr-sm-2">
                                    <input class="form-check-input" type="checkbox" id="inlineFormCheck" checked>
                                    <label class="form-check-label" for="inlineFormCheck">
                                        Remember me
                                    </label>
                                </div>

                                <button type="submit" class="btn btn-primary mb-2">Submit</button>
                            </form>


                            <br>
                            <h3>Horizontal Form</h3>
                            <br/>
                            <form>
                                <div class="form-group row">
                                    <label for="inputEmail3" class="col-sm-2 col-form-label">Email</label>
                                    <div class="col-sm-10">
                                        <input type="email" class="form-control" id="inputEmail3" placeholder="Email">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="inputPassword3" class="col-sm-2 col-form-label">Password</label>
                                    <div class="col-sm-10">
                                        <input type="password" class="form-control" id="inputPassword3" placeholder="Password">
                                    </div>
                                </div>
                                <fieldset class="form-group">
                                    <div class="row">
                                        <legend class="col-form-label col-sm-2 pt-0">Radios</legend>
                                        <div class="col-sm-10">
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
                                                <label class="form-check-label" for="gridRadios1">
                                                    First radio
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios2" value="option2">
                                                <label class="form-check-label" for="gridRadios2">
                                                    Second radio
                                                </label>
                                            </div>
                                            <div class="form-check disabled">
                                                <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios3" value="option3" disabled>
                                                <label class="form-check-label" for="gridRadios3">
                                                    Third disabled radio
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </fieldset>
                                <div class="form-group row">
                                    <div class="col-sm-2">Checkbox</div>
                                    <div class="col-sm-10">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="gridCheck1" checked>
                                            <label class="form-check-label" for="gridCheck1" >
                                                Example checkbox
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-10">
                                        <button type="submit" class="btn btn-primary">Sign in</button>
                                    </div>
                                </div>
                            </form>


                            <br>
                            <h3>Grid Form</h3>
                            <br>
                            <form>
                                <div class="form-row">
                                    <div class="col-7">
                                        <input type="text" class="form-control" placeholder="City">
                                    </div>
                                    <div class="col">
                                        <input type="text" class="form-control" placeholder="State">
                                    </div>
                                    <div class="col">
                                        <input type="text" class="form-control" placeholder="Zip">
                                    </div>
                                </div>
                            </form>


                            <br>
                            <h3>Disabled States</h3>
                            <br>
                            <form>
                                <fieldset disabled>
                                    <div class="form-group">
                                        <label for="disabledTextInput">Disabled input</label>
                                        <input type="text" id="disabledTextInput" class="form-control" placeholder="Disabled input">
                                    </div>
                                    <div class="form-group">
                                        <label for="disabledSelect">Disabled select menu</label>
                                        <select id="disabledSelect" class="form-control">
                                            <option>Disabled select</option>
                                        </select>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="disabledFieldsetCheck" disabled>
                                        <label class="form-check-label" for="disabledFieldsetCheck">
                                            Can't check this
                                        </label>
                                    </div>
                                    <button type="submit" class="btn btn-primary">Submit</button>
                                </fieldset>
                            </form>
                            <br>
                            <h3>Styled Checkboxes & Radio Buttons</h3>
                            <p>Custom Styled checkboxes and radio buttons using only CSS. Wrap you the label and input in a div with the class <code>.custom-checkbox</code> or <code>.custom-radio</code></p>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
                                <label class="form-check-label" for="defaultCheck1">
                                    Default checkbox
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="defaultCheck2" disabled>
                                <label class="form-check-label" for="defaultCheck2">
                                    Disabled checkbox
                                </label>
                            </div>

                            <br/>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">
                                <label class="form-check-label" for="inlineCheckbox1">1</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2">
                                <label class="form-check-label" for="inlineCheckbox2">2</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="option3" disabled>
                                <label class="form-check-label" for="inlineCheckbox3">3 (disabled)</label>
                            </div>
                            <br/>
                            <br/>

                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="option1" checked>
                                <label class="form-check-label" for="exampleRadios1">
                                    Default radio
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios2" value="option2">
                                <label class="form-check-label" for="exampleRadios2">
                                    Second default radio
                                </label>
                            </div>
                            <div class="form-check disabled">
                                <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios3" value="option3" disabled>
                                <label class="form-check-label" for="exampleRadios3">
                                    Disabled radio
                                </label>
                            </div>

                            <br/>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
                                <label class="form-check-label" for="inlineRadio1">1</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
                                <label class="form-check-label" for="inlineRadio2">2</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3" disabled>
                                <label class="form-check-label" for="inlineRadio3">3 (disabled)</label>
                            </div>
                        </section>

                        <hr/>

                        <section id="buttons" class="section">
                            <h2 class="legend">Buttons</h2>
                            <h3>Basic Example</h3>
                            <button type="button" class="btn btn-primary">Primary</button>
                            <button type="button" class="btn btn-secondary">Secondary</button>
                            <button type="button" class="btn btn-success">Success</button>
                            <button type="button" class="btn btn-danger">Danger</button>
                            <button type="button" class="btn btn-warning">Warning</button>
                            <button type="button" class="btn btn-info">Info</button>
                            <button type="button" class="btn btn-light">Light</button>
                            <button type="button" class="btn btn-dark">Dark</button>

                            <button type="button" class="btn btn-link">Link</button>

                            <br>
                            <br>
                            <br>
                            <h3>outline Basic Example</h3>
                            <br>
                            <button type="button" class="btn btn-outline-primary">Primary</button>
                            <button type="button" class="btn btn-outline-secondary">Secondary</button>
                            <button type="button" class="btn btn-outline-success">Success</button>
                            <button type="button" class="btn btn-outline-danger">Danger</button>
                            <button type="button" class="btn btn-outline-warning">Warning</button>
                            <button type="button" class="btn btn-outline-info">Info</button>
                            <button type="button" class="btn btn-outline-light">Light</button>
                            <button type="button" class="btn btn-outline-dark">Dark</button>
                            <br/>
                            <br/>
                            <h3>Disabled States</h3>
                            <p>Add the <code>disabled</code> attribute to buttons to prevent a user from interacting with the element. By default disabled buttons appear lighter.</p>
                            <button type="button" class="btn btn-lg btn-primary" disabled>Primary button</button>
                            <button type="button" class="btn btn-secondary btn-lg" disabled>Button</button>
                            <br>
                            <br>
                            <br><h3>LINKS</h3>
                            <p>Add the <code>disabled</code> attribute to buttons to prevent a user from interacting with the element. By default disabled buttons appear lighter.</p>
                            <a href="#" class="link" role="button" aria-disabled="true">link</a>
                            <a href="#" class="link link--arrow">
                                arrow link
                                <span class="icon-arrow-right"></span>
                            </a>
                            <br>
                            <br>
                            <br>
                            <a href="#" class="btn btn-primary btn-lg disabled" role="button" aria-disabled="true">Primary link</a>
                            <a href="#" class="btn btn-secondary btn-lg disabled" role="button" aria-disabled="true">Link</a>
                            <br>
                            <br>
                            <br><h3>Toggle Buttons</h3>
                            <div class="btn-group" data-toggle="buttons">
                                <label class="btn btn-toggle active">
                                    <input type="radio" name="options" id="option1" autocomplete="off" checked> English
                                </label>
                                <label class="btn btn-toggle">
                                    <input type="radio" name="options" id="option2" autocomplete="off">  FRANCAIS
                                </label>
                            </div>
                            <br>
                            <br>
                            <h3>Block Buttons</h3>
                            <button type="button" class="btn btn-primary btn-lg btn-block">Block level button</button>
                            <button type="button" class="btn btn-secondary btn-lg btn-block">Block level button</button>
                        </section>

                        <hr/>

                        <section id="grid" class="section">
                            <h2 class="legend">Grid</h2>
                            <p>
                                Using the grid system, we can make complex layouts using a minimal amount of markup. Grid columns are based on 12 columns and utilize the
                                same naming convention and functionality as Bootstrap.
                            </p>

                            <div class="grid-container">
                                <div class="row">
                                    <div class="col-md-1">.col-md-1</div>
                                    <div class="col-md-1">.col-md-1</div>
                                    <div class="col-md-1">.col-md-1</div>
                                    <div class="col-md-1">.col-md-1</div>
                                    <div class="col-md-1">.col-md-1</div>
                                    <div class="col-md-1">.col-md-1</div>
                                    <div class="col-md-1">.col-md-1</div>
                                    <div class="col-md-1">.col-md-1</div>
                                    <div class="col-md-1">.col-md-1</div>
                                    <div class="col-md-1">.col-md-1</div>
                                    <div class="col-md-1">.col-md-1</div>
                                    <div class="col-md-1">.col-md-1</div>
                                </div>
                                <br/>
                                <br/>
                                <br/>
                                <div class="row">
                                    <div class="col-md-8">.col-md-8</div>
                                    <div class="col-md-4">.col-md-4</div>
                                </div>
                                <br/>
                                <br/>
                                <br/>
                                <div class="row">
                                    <div class="col-md-4">.col-md-4</div>
                                    <div class="col-md-4">.col-md-4</div>
                                    <div class="col-md-4">.col-md-4</div>
                                </div>
                                <br/>
                                <br/>
                                <br/>
                                <div class="row">
                                    <div class="col-md-6">.col-md-6</div>
                                    <div class="col-md-6">.col-md-6</div>
                                </div>
                            </div>

                        </section>

                        <hr/>

                        <section id="tables" class="section">
                            <h2 class="legend">Tables</h2>

                            <h3>Standard Data Table + Responsive Stacking</h3>

                            <p class="section-info">
                                A table can be given the class "responsive-table" to enable stacking table cells once a specific breakpoint
                                is reached.
                            </p>

                            <table class="table responsive-table">
                                <thead>
                                    <tr class="responsive-table-head d-none d-md-table-row">
                                        <th>Table Heading 1</th>
                                        <th>Table Heading 2</th>
                                        <th>Table Heading 3</th>
                                        <th>Table Heading 4</th>
                                        <th>Table Heading 5</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="responsive-table-item">
                                        <td class="d-md-none">Table Heading 1</td>
                                        <td class="responsive-table-cell">Table Cell 1</td>
                                        <td class="d-md-none">Table Heading 2</td>
                                        <td class="responsive-table-cell">Table Cell 2</td>
                                        <td class="d-md-none">Table Heading 3</td>
                                        <td class="responsive-table-cell">Table Cell 3</td>
                                        <td class="d-md-none">Table Heading 4</td>
                                        <td class="responsive-table-cell">Table Cell 4</td>
                                        <td class="d-md-none  responsive-table-cell-bold">Table Heading 5</td>
                                        <td class="responsive-table-cell  responsive-table-cell-bold">Table Cell 5</td>
                                    </tr>

                                </tbody>
                            </table>

                            <br>
                            <h3>Product Info Tables</h3>
                            <p>
                                Product tables appear in areas like the Shopping Cart, Checkout Review and My Account Order History.
                                They typically include the information displayed below. Using a few helper classes, we can
                                streamline the layout of these types of tables. Adding a <code>.product-table</code> class, in addition
                                to the <code>.table-stacked</code> class gives us these styles.
                            </p>
                            <table class="table table-stacked product-table no-headers">
                                <colgroup>
                                    <col/>
                                    <col/>
                                    <col/>
                                    <col/>
                                </colgroup>
                                <thead>
                                <tr>
                                    <th>Item</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>
                                        <a href="#" class="product-image">
                                            <img src="http://placehold.it/200x150" />
                                        </a>
                                        <div class="product-info">
                                            <a href="#">Product Name</a>
                                            <ul>
                                                <li>Item specs</li>
                                                <li>Item specs</li>
                                                <li>Item specs</li>
                                            </ul>
                                        </div>
                                    </td>
                                    <td data-header="Subtotal">$1000.00</td>
                                    <td data-header="Quantity">2</td>
                                    <td data-header="Total">$2000.00</td>
                                </tr>
                                </tbody>
                            </table>
                        </section>

                        <hr/>

                        <section id="pagination" class="section">
                            <h2 class="legend">Pagination</h2>
                            <h3>Basic Example</h3>
                            <nav aria-label="Page navigation example">
                                <ul class="pagination">
                                    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                    <li class="page-item"><a class="page-link" href="#">Next</a></li>
                                </ul>
                            </nav>
                            <br>
                            <br>
                            <br>
                            <h3>icons Example</h3>
                            <nav aria-label="Page navigation example">
                                <ul class="pagination">
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                    </li>
                                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                            <br/>
                            <br/>
                            <br/>
                            <br/>
                            <h3>state Example</h3>
                            <nav aria-label="Page navigation example">
                                <ul class="pagination">
                                    <li class="page-item disabled">
                                        <a class="page-link" href="#" tabindex="-1">Previous</a>
                                    </li>
                                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                                    <li class="page-item active">
                                        <a class="page-link" href="#">2 <span class="sr-only">(current)</span></a>
                                    </li>
                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                    <li class="page-item">
                                        <a class="page-link" href="#">Next</a>
                                    </li>
                                </ul>
                            </nav>
                        </section>

                        <hr/>

                        <section id="responsive-embeds" class="section">
                            <h2 class="legend">Responsive Embeds</h2>

                            <p class="section-info">
                                For embeds that need to remain responsive use the <code>.embed-responsive</code> class to kick it off and
                                for each aspect ratio use the corresponding class:
                            </p>
                            <ul>
                                <li><code>.embed-responsive-16by9</code></li>
                                <li><code>.embed-responsive-21by9</code></li>
                                <li><code>.embed-responsive-16by9</code></li>
                                <li><code>.embed-responsive-4by3</code></li>
                                <li><code>.embed-responsive-1by1</code></li>
                            </ul>

                            <!-- 21:9 aspect ratio -->
                            <div class="embed-responsive embed-responsive-21by9">
                                <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/INscMGmhmX4?modestbranding=1&amp;controls=0&amp;showinfo=0"></iframe>
                            </div>

                            <!-- 16:9 aspect ratio -->
                            <div class="embed-responsive embed-responsive-16by9">
                                <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/zpOULjyy-n8?rel=0" allowfullscreen></iframe>
                            </div>

                            <!-- 4:3 aspect ratio -->
                            <div class="embed-responsive embed-responsive-4by3">
                                <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/zpOULjyy-n8?rel=0" allowfullscreen></iframe>>
                            </div>

                            <!-- 1:1 aspect ratio -->
                            <div class="embed-responsive embed-responsive-1by1">
                                <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/zpOULjyy-n8?rel=0" allowfullscreen></iframe>
                            </div>
                        </section>
                        <br/>
                        <br/>
                        <br/>
                        <hr/>
                        <section id="dropdown" class="section">
                            <h2 class="legend">Dropdown</h2>

                            <p class="section-info">
                                Any single .btn can be turned into a dropdown toggle with some markup changes.
                            </p>
                            <div class="dropdown">
                                <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Dropdown button
                                </button>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <a class="dropdown-item" href="#">Action</a>
                                    <a class="dropdown-item" href="#">Another action</a>
                                    <a class="dropdown-item" href="#">Something else here</a>
                                </div>
                            </div>
                            <br/>
                            <br/>
                            <br/>

                            <div class="dropdown show">
                                <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Dropdown link
                                </a>

                                <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                    <a class="dropdown-item" href="#">Action</a>
                                    <a class="dropdown-item" href="#">Another action</a>
                                    <a class="dropdown-item" href="#">Something else here</a>
                                </div>
                            </div>
                        </section>
                        <br/>
                        <br/>
                        <br/>
                        <hr/>


                        <section id="modals" class="section">
                            <h2 class="legend">Modal</h2>

                            <p class="section-info">
                                Add .modal-dialog-centered to .modal-dialog to vertically center the modal.
                            </p>


                            <!-- Button trigger modal -->
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
                                Launch demo modal
                            </button>

                            <!-- Modal -->
                            <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true" class="icon-remove"></span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ullamcorper sapien id nulla luctus sodales. Maecenas quis ante ut erat dignissim dignissim. Sed ac mauris non ante sollicitudin sodales ut ut lectus. In hac habitasse platea dictumst. Nunc vestibulum euismod mi, vel porta tellus varius id. Mauris metus diam, ornare non sem non, consectetur mollis tortor. In hac habitasse platea dictumst. Morbi ac nulla pellentesque purus elementum interdum. Ut quis aliquam felis. Duis efficitur risus varius sem pellentesque maximus. Aenean ullamcorper justo ac velit vulputate, a pulvinar eros cursus.
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                            <button type="button" class="btn btn-primary">Save changes</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>                        <br/>
                        <br/>
                        <br/>
                        <hr/>


                        <section id="tabs" class="section">
                            <h2 class="legend">Tabs</h2>

                            <p class="section-info">
                                Click the buttons below to show and hide another element via class changes:
                            </p>

                            <ul>
                                <li>.collapse hides content</li>
                                <li>.collapsing is applied during transitions</li>
                                <li>.collapse.show shows content</li>
                            </ul>
                            <p>You can use a link with the href attribute, or a button with the data-target attribute. In both cases, the data-toggle="collapse" is required.</p>

                            <p>
                                <a class="btn btn-primary" data-toggle="collapse" href="#multiCollapseExample1" role="button" aria-expanded="false" aria-controls="multiCollapseExample1">Toggle first element</a>
                                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#multiCollapseExample2" aria-expanded="false" aria-controls="multiCollapseExample2">Toggle second element</button>
                                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target=".multi-collapse" aria-expanded="false" aria-controls="multiCollapseExample1 multiCollapseExample2">Toggle both elements</button>
                            </p>
                            <div class="row">
                                <div class="col">
                                    <div class="collapse multi-collapse" id="multiCollapseExample1">
                                        <div class="card card-body">
                                            Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident.
                                        </div>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="collapse multi-collapse" id="multiCollapseExample2">
                                        <div class="card card-body">
                                            Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident.
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <br/>
                            <br/>
                            <br/>
                            <ul class="nav nav-tabs" id="myTab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Home</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Profile</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="false">Contact</a>
                                </li>
                            </ul>
                            <div class="tab-content" id="myTabContent">
                                <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                    Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                                </div>
                                <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                                    sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad ve
                                </div>
                                <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">...</div>
                            </div>
                        </section>
                        <hr/>
                        <br/>
                        <br/>
                        <br/>
                        <section id="accordion" class="section">
                            <h3>Accordion exemaple</h3>
                            <br/>
                            <div id="accordion">
                                <div class="card">
                                    <div class="card-header" id="headingOne">
                                        <h5 class="mb-0">
                                            <button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                                Collapsible Group Item #1
                                            </button>
                                        </h5>
                                    </div>

                                    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
                                        <div class="card-body">
                                            Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-header" id="headingTwo">
                                        <h5 class="mb-0">
                                            <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                                Collapsible Group Item #2
                                            </button>
                                        </h5>
                                    </div>
                                    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
                                        <div class="card-body">
                                            Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-header" id="headingThree">
                                        <h5 class="mb-0">
                                            <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                                Collapsible Group Item #3
                                            </button>
                                        </h5>
                                    </div>
                                    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordion">
                                        <div class="card-body">
                                            Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </section>
                    </div>
                </div>
            </div>
        </div>
</template:page>
