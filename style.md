---
title: Style
---

<div id="headers">
  <br/><hr/>
  <a href="#headers">Headers</a>
  <hr/>
    <h1>Header 1 <code>&lt;h1&gt;</code></h1>
    <h2>Header 2 <code>&lt;h2&gt;</code></h2>
    <h3>Header 3 <code>&lt;h3&gt;</code></h3>
</div>
<div id="paragraph">
  <br/><hr/>
  <a href="#paragraph">Paragraph</a>
  <hr/>
  <p>This is paragraph text.</p>
</div>
<div id="link">
  <br/><hr/>
  <a href="#link">Hyperlink</a>
  <hr/>
  <a href="">This is a link</a>
</div>
<div id="lists">
  <br/><hr/>
  <a href="#lists">Lists</a>
  <hr />
  <b>Ordered list</b>: <code>&lt;ol&gt;</code>
  <ol>
    <li>List item 1</li>
    <li>List item 2</li>
  </ol>
  <b>Unordered list</b>: <code>&lt;ul&gt;</code>
  <ul>
    <li>List item 1</li>
    <li>List item 2</li>
  </ul>
  <b>Unordered list, no bullets, margin and line height</b>:<br/>
  <code>&lt;ul style="list-style: none; margin-left:0px; line-height:250%;"&gt;</code>
  <ul style="list-style: none; margin-left:0px; line-height:250%;">
    <li>List item 1</li>
    <li>List item 2</li>
  </ul>
</div>
<div id="color">
  <br/><hr/>
  <a href="#color">Color Palette </a>
  <hr/>
  Primary Palette<br/>
  <div style="width:100px;height:200px;margin:0px 10px;border:0px;text-align:center;background:#000000;color:white;float:left">Black<br/>#000000</div>
  <div style="width:100px;height:200px;margin:0px 10px;border:0px;text-align:center;background:#F5F6F6;float:left;">Grey<br/>#F5F6F6</div>
  <div style="width:100px;height:200px;margin:0px 10px;border:1px solid #000;text-align:center;background:#FFFFFF;float:left;">White<br/>#FFFFFF</div>
<div style="clear:both;">
Secondary Palette<br/>
  <div style="width:100px;height:200px;margin:0px 10px;border:0px;text-align:center;background:#3955E7;color:white;float:left">Organism Blue<br/>#3955E7</div>
  <div style="width:100px;height:200px;margin:0px 10px;border:0px;text-align:center;background:#00CC9E;color:white;float:left;">Community Green<br/>#00CC9E</div>
  <div style="width:100px;height:200px;margin:0px 10px;border:1px solid #000;text-align:center;background:#880BC8;color:white;float:left;">Annotation Purple<br/>#880BC8</div>
  <div style="width:100px;height:200px;margin:0px 10px;border:0px;text-align:center;background:#FF8120;color:white;float:left;">Pathway Orange<br/>#FF8120</div>
<div style="clear:both;">
Tertiary Palette (Hover/Disabled)<br/>
  <div style="width:100px;height:200px;margin:0px 10px;border:0px;text-align:center;background:#1E3199;color:white;float:left">Organism Dark Blue<br/>#1E3199</div>
  <div style="width:100px;height:200px;margin:0px 10px;border:0px;text-align:center;background:#028F6F;color:white;float:left;">Community Dark Green<br/>#028F6F</div>
  <div style="width:100px;height:200px;margin:0px 10px;border:1px solid #000;text-align:center;background:#620492;color:white;float:left;">Annotation Dark Purple<br/>#620492</div>
  <div style="width:100px;height:200px;margin:0px 10px;border:0px;text-align:center;background:#D16919;color:white;float:left;">Pathway Dark Orange<br/>#D16919</div>
  <div style="width:100px;height:200px;margin:0px 10px;border:0px;text-align:center;background:#94A6A8;color:white;float:left;">Dark Grey<br/>#94A6A8</div>
</div>
<div id="buttons" style="clear:both;">
  <br/><hr/>
  <a href="#buttons">Buttons</a>
  <hr/>
  <div class="row gy-6 py-3">
    <div class="col">
      <div class="bg-gradient p-3" style="background-color: #eeeeee;">
        <ul style="list-style: none; margin-left:0px; line-height:250%;">
          <li> <a class="btn btn-sm btn-pill btn-outline-warning" href="#" target="_blank">Link button (external) </a></li>
          <li> <a class="btn btn-sm btn-pill btn-outline-warning" href="#">Link button (internal)</a></li>
          <li> <a class="btn btn-sm btn-pill btn-organism" href="#">Organism button</a></li>
          <li> <a class="btn btn-sm btn-pill btn-community" href="#">Community button</a></li>
          <li> <a class="btn btn-sm btn-pill btn-annotation" href="#">Annotation button</a></li>
           <li> <a class="btn btn-sm btn-pill btn-pathway" href="#">Pathway button</a></li>
           <li> <a class="btn btn-sm btn-front" href="#">Front button</a></li>
        </ul>
      </div>
    </div>
    <div class="col-9">
      <div class="bg-gradient p-3 " style="background-color: #ffffff;">
        <ul style="list-style: none; margin-left:0px; line-height:250%;">
          <li> <code>&lt;a class="btn btn-sm btn-pill btn-outline-warning" href="#" target="_blank"&gt;</code></li>
          <li> <code>&lt;a class="btn btn-sm btn-pill btn-outline-warning" href="#"&gt;</code></li>
          <li> <code>&lt;a class="btn btn-sm btn-pill btn-organism" href="#"&gt;</code></li>
          <li> <code>&lt;a class="btn btn-sm btn-pill btn-community" href="#"&gt;</code></li>
          <li> <code>&lt;a class="btn btn-sm btn-pill btn-annotation" href="#"&gt;</code></li>
          <li> <code>&lt;a class="btn btn-sm btn-pill btn-pathway" href="#"&gt;</code></li>
          <li> <code>&lt;a class="btn btn-sm btn-front" href="#"&gt;</code></li>
        </ul>
      </div>
    </div>
  </div> 
</div>
<div id="socials">
  <br/><hr/>
  <a href="#socials">Socials</a> 
  <hr/>
    <code>&#123;% include_cached share.html %&#125;</code>
  <br/><br/>
  {% include_cached share.html %}
</div>
<div id="actions"> 
  <br/><hr/>
  <a href="#actions">Actions</a>
  <hr/>
    <code>
    &lt;button class="copy-btn" to-copy="" style="border:none; background-color:#FFFFFF; padding:0px;"&gt;
    <br/>&nbsp;&lt;span title="Copy link to clipboard" style="color: #666;"&gt;&lt;i class="fa fa-link"&gt;
    </code>
  <br/><br/>
  <button class="copy-btn" to-copy=""
    style="border:none; background-color:#FFFFFF; padding:0px;">
    <span title="Copy link to clipboard" style="color: #666;"><i class="fa fa-link"></i></span>
  </button>
  <button class="embed-btn" to-copy=''
    style="border:none; background-color:#FFFFFF; padding:0px;">
    <span title="Copy embed code" style="color: #666;"><i class="fa fa-code"></i></span>
  </button>
  <a href="" target="_blank">
    <span title="Save as PDF" style="color: #666;"><i class="fa fa-file-pdf-o"></i></span>
  </a>
  <a href="" target="_blank">
    <span title="Edit markdown" style="color: #666;"><i
        class="fa fa-pencil"></i></span>
  </a>
</div>
<div id="tables">
  <br/><hr/>
  <a href="#tables">Tables</a>
  <hr/>
    <code>&lt;table&gt;</code>
  <br/><br/>
    <table class="w-50">
      <thead>
        <th>Col 1</th>
        <th>Col 2</th>
        <th>Col 3</th>
      </thead>
      <tbody>
        <tr>
          <td>Cell 1A</td>
          <td>Cell 2A</td>
          <td>Cell 3A</td>
        </tr>
        <tr>
          <td>Cell 1B</td>
          <td>Cell 2B</td>
          <td>Cell 3B</td>
        </tr>
        <tr>
          <td>Cell 1C</td>
          <td>Cell 2C</td>
          <td>Cell 3C</td>
        </tr>
      </tbody>
    </table>
</div>
<div id="pathway-card">
  <br/><hr/>
  <a href="#pathway-card">Pathway Card</a>
  <hr/>
  <code>&lt;div class="card w-20" style="width: 10rem;"&gt;
  <br/>&nbsp;&lt;a class="card-link" href="{{ pw.url }}"&gt;
  <br/>&nbsp;&nbsp;&lt;img class="card-img-top" loading="lazy" src=""&gt;
  <br/>&nbsp;&nbsp;&lt;div class="card-body"&gt;
  <br/>&nbsp;&nbsp;&nbsp;&lt;p class="card-text"&gt;
  </code>
  <br/><br/>
  {% assign sorted_pathways = site.pathways | sort: "last-edited" %}
  {% assign pw = sorted_pathways.last %}
  <div class="card w-20" style="width: 10rem;">
    <a class="card-link" href="{{ pw.url }}">
      <img class="card-img-top" loading="lazy" src="/assets/img/{{pw.wpid}}/{{pw.wpid}}-thumb.png" alt="{{ pw.title }}">
      <div class="card-body">
        <p class="card-text">{{ pw.title }} <em>({{ pw.organisms.first }})</em></p>
      </div>
    </a>
  </div>
</div>
<div id="pathway-list">
  <br/><hr/>
  <a href="#pathway-list">Pathway List</a>
  <hr/>
  <code>&lt;ul class="nav nav-tabs"&gt;</code>
  <br/><br/>
  <ul class="nav nav-tabs">
    <li class="nav-item">
      <a class="nav-link active" data-toggle="tab" href="#gallery">Gallery</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="tab" href="#list">List</a>
    </li>
  </ul>
  {% assign sorted_pathways = site.pathways | sort: "title" | slice:0, 4 %}
  <div class="tab-content" >
    <div class="tab-pane fade show active" id="gallery" role="tabpanel">
      <br/>
      <div class="row">
      {% for pw in sorted_pathways %}
          <div class="col-sm-auto">
            <div class="card" style="width: 10rem;">
              <a class="card-link" href="{{ pw.url }}">
              <img class="card-img-top" loading="lazy" src="/assets/img/{{pw.wpid}}/{{pw.wpid}}-thumb.png" alt="{{ pw.title }}">
              <div class="card-body">
                <p class="card-text">{{ pw.title }} <em>({{ pw.organisms.first }})</em></p>
              </div>
              </a>
            </div>
          </div>
      {% endfor %}
    </div>
  </div>
  <div class="tab-pane fade" id="list" role="tabpanel">
    <br/>
    <div class="row" style="margin-left: 10px;">
      <ul>
        {% for pw in sorted_pathways %}
              <li><a href="{{ pw.url }}">{{ pw.title }} <em>({{ pw.organisms.first }})</em></a></li>
        {% endfor %}
      </ul>
    </div>  
  </div>
</div>
