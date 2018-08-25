<%@ taglib prefix="nav" tagdir="/WEB-INF/tags/responsive/nav" %>

<div id="product-facet" class="c-facets js-product-facet">
    <nav:facetNavAppliedFilters pageData="${searchPageData}"/>
    <nav:facetNavRefinements pageData="${searchPageData}"/>
</div>

<div class="js-product-facet">
    <div class="c-product-facet modal fade"  tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">
                        <spring:theme code="search.nav.selectRefinements.title" />
                    </h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true" class="icon-remove"></span>
                    </button>
                </div>
                <div class="modal-body">
                    <nav:facetNavAppliedFilters pageData="${searchPageData}"/>
                    <nav:facetNavRefinements pageData="${searchPageData}"/>
                </div>
            </div>
        </div>
    </div>
</div>
