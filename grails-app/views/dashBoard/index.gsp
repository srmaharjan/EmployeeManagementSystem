<!doctype html>
<html>
<head>
      <meta name="layout" content="main">
      <title>Ligon Tech - DashBoard</title>
</head>
<body>
<form action="#" method="post" class="form-horizontal style1" enctype="multipart/form-data" novalidate="novalidate">
<fieldset class="form">
<fieldset>
      <legend>Personal Info</legend>
      <div class="control-group fieldcontain  required">
            <label for="firstName" class="control-label">First Name<span class="required-indicator">*</span></label>
            <div class="controls">
                  <input type="text" name="firstName" required="" value="first name" id="firstName" class="large">
                  <span class="help-inline"></span> </div>
      </div>
      <div class="control-group fieldcontain  ">
            <label for="middleName" class="control-label">Middle Name</label>
            <div class="controls">
                  <input type="text" name="middleName" value="middle name" id="middleName" class="large">
                  <span class="help-inline"></span> </div>
      </div>
      <div class="control-group fieldcontain  required">
            <label for="lastName" class="control-label">Last Name<span class="required-indicator">*</span></label>
            <div class="controls">
                  <input type="text" name="lastName" required="" value="last name" id="lastName" class="large">
                  <span class="help-inline"></span> </div>
      </div>
      <div class="control-group fieldcontain  required">
            <label for="email" class="control-label">Email <span class="required-indicator">*</span></label>
            <div class="controls">
                  <input type="text" name="email" required="" value="" id="email" class="large">
                  <span class="help-inline"></span> </div>
      </div>
      <div class="control-group fieldcontain  required">
            <label for="fatherName" class="control-label">Father Name <span class="required-indicator">*</span></label>
            <div class="controls">
                  <input type="text" name="fatherName" required="" value="" id="fatherName" class="large">
                  <span class="help-inline"></span> </div>
      </div>
      <div class="control-group fieldcontain  required">
            <label for="expectedSalary" class="control-label">Expected Salary <span class="required-indicator">*</span></label>
            <div class="controls">
                  <input type="text" name="expectedSalary" required="" value="" id="expectedSalary" class="medium">
                  <span class="help-inline"></span> </div>
      </div>
      <div class="control-group fieldcontain  required">
            <label for="dateOfBirth" class="control-label">Date Of Birth<span class="required-indicator">*</span></label>
            <div class="controls">
                  <div class="input-prepend date" id="dateOfBirth" data-date="2013-10-01" data-date-format="yyyy-mm-dd"> <span class="add-on"><i class="icon-th"></i></span>
                        <input type="text" name="dateOfBirth" required="" value="2013-10-01"  class="small" readonly="readonly" id="dateOfBirth">
                  </div>
                  <span class="help-inline"></span> </div>
      </div>
      <div class="control-group fieldcontain  required">
            <label for="_nationality" class="control-label">Nationality<span class="required-indicator">*</span></label>
            <div class="controls">
                  <input type="text" name="_nationality" required="" data-provide="typeahead" autocomplete="off" value="Mechi" id="_nationality" class="medium">
                  <input type="hidden" name="nationality.id" id="nationality" value="28" class="medium">
                  <span class="help-inline"></span> </div>
      </div>
      <div class="control-group fieldcontain  required">
            <label for="contactNumber" class="control-label">Contact Number<span class="required-indicator">*</span></label>
            <div class="controls">
                  <input type="text" name="contactNumber" required="" value="79879872" id="contactNumber" class="medium">
                  <span class="help-inline"></span> </div>
      </div>
      <div class="control-group fieldcontain  ">
            <label for="mobileNumber" class="control-label">Mobile Number</label>
            <div class="controls">
                  <input type="text" name="mobileNumber" value="42342234" id="mobileNumber" class="medium">
                  <span class="help-inline"></span> </div>
      </div>
      <div class="control-group fieldcontain  ">
            <label for="complexion" class="control-label">Complexion</label>
            <div class="controls">
                  <input type="text" name="complexion" value="white" id="complexion" class="small">
                  <span class="help-inline"></span> </div>
      </div>
      <div class="control-group fieldcontain  required">
            <label for="gender" class="control-label">Gender<span class="required-indicator">*</span></label>
            <div class="controls">
                  <label class="radio inline">
                        <input type="radio" name="gender.id" checked="checked" value="9" id="gender">
                        Male </label>
                  <label class="radio inline">
                        <input type="radio" name="gender.id" value="10" id="gender">
                        Female </label>
                  <span class="help-inline"></span> </div>
      </div>
      <div class="control-group fieldcontain  ">
            <label for="height" class="control-label">Height</label>
            <div class="controls">
                  <input type="text" name="height" class="span2" value="1.3" id="height">
                  &nbsp;&nbsp;Meters <span class="help-inline"></span> </div>
      </div>
      <div class="control-group fieldcontain  ">
            <label for="martialStatus" class="control-label">Martial Status</label>
            <div class="controls">
                  <select id="martialStatus" name="martialStatus.id" class="small">
                        <option value="">--Select--</option>
                        <option value="54">Single</option>
                        <option value="55">Married</option>
                  </select>
                  <span class="help-inline"></span> </div>
      </div>
      <div class="control-group fieldcontain  ">
            <label for="religion" class="control-label">Religion</label>
            <div class="controls">
                  <select id="religion" name="religion.id" class="small">
                        <option value="">--Select--</option>
                        <option value="1" selected="selected">Hindu</option>
                        <option value="2">Buddhist</option>
                        <option value="3">Islam</option>
                        <option value="4">Christian</option>
                  </select>
                  <span class="help-inline"></span> </div>
      </div>
      <div class="control-group fieldcontain  ">
            <label for="weight" class="control-label">Weight</label>
            <div class="controls">
                  <input type="text" name="weight" class="small" value="80" id="weight">
                  &nbsp;&nbsp;kg <span class="help-inline"></span> </div>
      </div>
      <div class="control-group fieldcontain  required">
            <label for="photo_file" class="control-label">Photo <span class="required-indicator">*</span></label>
            <div class="fileUpload btn btn-primary controls">
                  <input id="photo_file" placeholder="Choose File" disabled="disabled" />
                  <span>Upload</span>
                  <input id="uploadBtn" name ="photo_file" type="file" class="upload" />
            </div>
      </div>
      <style>
      .fileUpload {
            position: relative;
            overflow: hidden;
            margin: 10px;
      }
      .fileUpload input.upload {
            position: absolute;
            top: 0;
            right: 0;
            margin: 0;
            padding: 0;
            font-size: 20px;
            cursor: pointer;
            opacity: 0;
            filter: alpha(opacity=0);
      }
      </style>
</fieldset>
<fieldset>
<legend>Address</legend>
<fieldset id="currentAddress">
      <legend class="inner_legend">Current Address</legend>
      <div class="control-group fieldcontain  ">
            <label for="currentAddress.blockNumber" class="control-label">Block Number</label>
            <div class="controls">
                  <input type="text" name="currentAddress.blockNumber" value="39/13" id="currentAddress.blockNumber" class="medium">
                  <span class="help-inline"></span> </div>
      </div>
      <div class="control-group fieldcontain  ">
            <label for="currentAddress.street" class="control-label">Street</label>
            <div class="controls">
                  <input type="text" name="currentAddress.street" value="kilako galli" id="currentAddress.street" class="medium">
                  <span class="help-inline"></span> </div>
      </div>
      <div class="control-group fieldcontain  ">
            <label for="currentAddress.wardNumber" class="control-label">Ward Number</label>
            <div class="controls">
                  <input type="text" name="currentAddress.wardNumber" class="medium"value="18" id="currentAddress.wardNumber">
                  <span class="help-inline"></span> </div>
      </div>
      <div class="control-group fieldcontain  ">
            <label for="currentAddress.muncipalityOrVdc" class="control-label">Muncipality/Vdc</label>
            <div class="controls controls-row">
                  <input type="text" name="currentAddress.muncipalityOrVdc" value="kathmandu" id="currentAddress.muncipalityOrVdc" class="medium">
                  <span class="help-inline"></span> </div>
      </div>
      <div class="control-group fieldcontain  required">
            <label for="currentAddress.district" class="control-label">District<span class="required-indicator">*</span></label>
            <div class="controls">
                  <select id="district" name="currentAddress.district.id" class="many-to-one typeahead" data-provide="typeahead" style="display: none;">
                        <option value="56">Achham</option>
                        <option value="57">Arghakhanchi</option>
                        <option value="58">Baglung</option>
                        <option value="59">Baitadi</option>
                        <option value="60">Bajhang</option>
                        <option value="61">Bajura</option>
                        <option value="62">Banke</option>
                        <option value="63">Bara</option>
                        <option value="64">Bardiya</option>
                        <option value="65">Bhaktapur</option>
                        <option value="66">Bhojpur</option>
                        <option value="67">Chitwan</option>
                        <option value="68">Dadeldhura</option>
                        <option value="69">Dailekh</option>
                        <option value="70">Dang Deokhuri</option>
                        <option value="71">Darchula</option>
                        <option value="72">Dhading</option>
                        <option value="73">Dhankuta</option>
                        <option value="74">Dhanusa</option>
                        <option value="75">Dolakha</option>
                        <option value="76">Dolpa</option>
                        <option value="77">Doti</option>
                        <option value="78">Gorkha</option>
                        <option value="79">Gulmi</option>
                        <option value="80">Humla</option>
                        <option value="81">Ilam</option>
                        <option value="82">Jajarkot</option>
                        <option value="83">Jhapa</option>
                        <option value="84">Jumla</option>
                        <option value="85">Kailali</option>
                        <option value="86">Kalikot</option>
                        <option value="87">Kanchanpur</option>
                        <option value="88">Kapilvastu</option>
                        <option value="89">Kaski</option>
                        <option value="90" selected="selected">Kathmandu</option>
                        <option value="91">Kavrepalanchok</option>
                        <option value="92">Khotang</option>
                        <option value="93">Lalitpur</option>
                        <option value="94">Lamjung</option>
                        <option value="95">Mahottari</option>
                        <option value="96">Makwanpur</option>
                        <option value="97">Manang</option>
                        <option value="98">Morang</option>
                        <option value="99">Mugu</option>
                        <option value="100">Mustang</option>
                        <option value="101">Myagdi</option>
                        <option value="102">Nawalparasi</option>
                        <option value="103">Nuwakot</option>
                        <option value="104">Okhaldhunga</option>
                        <option value="105">Palpa</option>
                        <option value="106">Panchthar</option>
                        <option value="107">Parbat</option>
                        <option value="108">Parsa</option>
                        <option value="109">Pyuthan</option>
                        <option value="110">Ramechhap</option>
                        <option value="111">Rasuwa</option>
                        <option value="112">Rautahat</option>
                        <option value="113">Rolpa</option>
                        <option value="114">Rukum</option>
                        <option value="115">Rupandehi</option>
                        <option value="116">Salyan</option>
                        <option value="117">Sankhuwasabha</option>
                        <option value="118">Saptari</option>
                        <option value="119">Sarlahi</option>
                        <option value="120">Sindhuli</option>
                        <option value="121">Sindhupalchok</option>
                        <option value="122">Siraha</option>
                        <option value="123">Solukhumbu</option>
                        <option value="124">Sunsari</option>
                        <option value="125">Surkhet</option>
                        <option value="126">Syangja</option>
                        <option value="127">Tanahu</option>
                        <option value="128">Taplejung</option>
                        <option value="129">Terhathum</option>
                        <option value="130">Udayapur</option>
                  </select>
                  <input type="text" class="medium" autocomplete="off" data-value="90">
                  <span class="help-inline"></span> </div>
      </div>
      <div class="control-group fieldcontain  required">
            <label for="currentAddress.zone" class="control-label">Zone<span class="required-indicator">*</span></label>
            <div class="controls">
                  <select id="zone" name="currentAddress.zone.id" class="many-to-one typeahead" data-provide="typeahead" style="display: none;">
                        <option value="28">Mechi</option>
                        <option value="29">Koshi</option>
                        <option value="30">Sagarmatha</option>
                        <option value="31">Janakpur</option>
                        <option value="32" selected="selected">Bagmati</option>
                        <option value="33">Narayani</option>
                        <option value="34">Gandaki</option>
                        <option value="35">Dhawalagiri</option>
                        <option value="36">Lumbini</option>
                        <option value="37">Rapti</option>
                        <option value="38">Bheri</option>
                        <option value="39">Karnali</option>
                        <option value="40">Seti</option>
                        <option value="41">Mahakali</option>
                  </select>
                  <input type="text" class="medium" autocomplete="off" data-value="32">
                  <span class="help-inline"></span> </div>
      </div>
      <div class="control-group fieldcontain  required">
            <label for="currentAddress.country" class="control-label">Country <span class="required-indicator">*</span> </label>
            <div class="controls">
                  <select id="country" name="currentAddress.country.id"  data-provide="typeahead" style="display: none;">
                        <option value="1">Nepal</option>
                  </select>
                  <input type="text" class="medium" autocomplete="off" data-value="1">
                  <span class="help-inline"></span> </div>
      </div>
</fieldset>
<fieldset id="permanentAddress">
      <legend class="inner_legend">Permanent Address</legend>
      <div class="control-group">
            <div class="controls">
                  <label class="checkbox">
                        <input type="checkbox" name="same_as_current" id="same_as_current">
                        Same as Current Address </label>
            </div>
      </div>
      <div class="control-group fieldcontain  ">
            <label for="permanentAddress.blockNumber" class="control-label">Block Number</label>
            <div class="controls">
                  <input type="text" name="permanentAddress.blockNumber" value="39/13" id="permanentAddress.blockNumber">
                  <span class="help-inline"></span> </div>
      </div>
      <div class="control-group fieldcontain  ">
            <label for="permanentAddress.street" class="control-label">Street</label>
            <div class="controls">
                  <input type="text" name="permanentAddress.street" value="kilako galli" id="permanentAddress.street">
                  <span class="help-inline"></span> </div>
      </div>
      <div class="control-group fieldcontain  ">
            <label for="permanentAddress.wardNumber" class="control-label">Ward Number</label>
            <div class="controls">
                  <input type="text" name="permanentAddress.wardNumber" class="span2" value="18" id="permanentAddress.wardNumber">
                  <span class="help-inline"></span> </div>
      </div>
      <div class="control-group fieldcontain  ">
            <label for="permanentAddress.muncipalityOrVdc" class="control-label">Muncipality/Vdc</label>
            <div class="controls controls-row">
                  <input type="text" name="permanentAddress.muncipalityOrVdc" value="kathmandu" id="permanentAddress.muncipalityOrVdc">
                  <span class="help-inline"></span> </div>
      </div>
      <div class="control-group fieldcontain  required">
            <label for="permanentAddress.district" class="control-label">District<span class="required-indicator">*</span></label>
            <div class="controls">
                  <select id="district" name="permanentAddress.district.id" class="many-to-one typeahead" data-provide="typeahead" style="display: none;">
                        <option value="56">Achham</option>
                        <option value="57">Arghakhanchi</option>
                        <option value="58">Baglung</option>
                        <option value="59">Baitadi</option>
                        <option value="60">Bajhang</option>
                        <option value="61">Bajura</option>
                        <option value="62">Banke</option>
                        <option value="63">Bara</option>
                        <option value="64">Bardiya</option>
                        <option value="65">Bhaktapur</option>
                        <option value="66">Bhojpur</option>
                        <option value="67">Chitwan</option>
                        <option value="68">Dadeldhura</option>
                        <option value="69">Dailekh</option>
                        <option value="70">Dang Deokhuri</option>
                        <option value="71">Darchula</option>
                        <option value="72">Dhading</option>
                        <option value="73">Dhankuta</option>
                        <option value="74">Dhanusa</option>
                        <option value="75">Dolakha</option>
                        <option value="76">Dolpa</option>
                        <option value="77">Doti</option>
                        <option value="78">Gorkha</option>
                        <option value="79">Gulmi</option>
                        <option value="80">Humla</option>
                        <option value="81">Ilam</option>
                        <option value="82">Jajarkot</option>
                        <option value="83">Jhapa</option>
                        <option value="84">Jumla</option>
                        <option value="85">Kailali</option>
                        <option value="86">Kalikot</option>
                        <option value="87">Kanchanpur</option>
                        <option value="88">Kapilvastu</option>
                        <option value="89">Kaski</option>
                        <option value="90" selected="selected">Kathmandu</option>
                        <option value="91">Kavrepalanchok</option>
                        <option value="92">Khotang</option>
                        <option value="93">Lalitpur</option>
                        <option value="94">Lamjung</option>
                        <option value="95">Mahottari</option>
                        <option value="96">Makwanpur</option>
                        <option value="97">Manang</option>
                        <option value="98">Morang</option>
                        <option value="99">Mugu</option>
                        <option value="100">Mustang</option>
                        <option value="101">Myagdi</option>
                        <option value="102">Nawalparasi</option>
                        <option value="103">Nuwakot</option>
                        <option value="104">Okhaldhunga</option>
                        <option value="105">Palpa</option>
                        <option value="106">Panchthar</option>
                        <option value="107">Parbat</option>
                        <option value="108">Parsa</option>
                        <option value="109">Pyuthan</option>
                        <option value="110">Ramechhap</option>
                        <option value="111">Rasuwa</option>
                        <option value="112">Rautahat</option>
                        <option value="113">Rolpa</option>
                        <option value="114">Rukum</option>
                        <option value="115">Rupandehi</option>
                        <option value="116">Salyan</option>
                        <option value="117">Sankhuwasabha</option>
                        <option value="118">Saptari</option>
                        <option value="119">Sarlahi</option>
                        <option value="120">Sindhuli</option>
                        <option value="121">Sindhupalchok</option>
                        <option value="122">Siraha</option>
                        <option value="123">Solukhumbu</option>
                        <option value="124">Sunsari</option>
                        <option value="125">Surkhet</option>
                        <option value="126">Syangja</option>
                        <option value="127">Tanahu</option>
                        <option value="128">Taplejung</option>
                        <option value="129">Terhathum</option>
                        <option value="130">Udayapur</option>
                  </select>
                  <input type="text" class="many-to-one typeahead" autocomplete="off" data-value="90">
                  <span class="help-inline"></span> </div>
      </div>
      <div class="control-group fieldcontain  required">
            <label for="permanentAddress.zone" class="control-label">Zone<span class="required-indicator">*</span></label>
            <div class="controls">
                  <select id="zone" name="permanentAddress.zone.id" class="many-to-one typeahead" data-provide="typeahead" style="display: none;">
                        <option value="28">Mechi</option>
                        <option value="29">Koshi</option>
                        <option value="30">Sagarmatha</option>
                        <option value="31">Janakpur</option>
                        <option value="32" selected="selected">Bagmati</option>
                        <option value="33">Narayani</option>
                        <option value="34">Gandaki</option>
                        <option value="35">Dhawalagiri</option>
                        <option value="36">Lumbini</option>
                        <option value="37">Rapti</option>
                        <option value="38">Bheri</option>
                        <option value="39">Karnali</option>
                        <option value="40">Seti</option>
                        <option value="41">Mahakali</option>
                  </select>
                  <input type="text" class="many-to-one typeahead" autocomplete="off" data-value="32">
                  <span class="help-inline"></span> </div>
      </div>
      <div class="control-group fieldcontain  required">
            <label for="permanentAddress.country" class="control-label">Country <span class="required-indicator">*</span> </label>
            <div class="controls">
                  <select id="country" name="permanentAddress.country.id" class="many-to-one typeahead" data-provide="typeahead" style="display: none;">
                        <option value="1">Nepal</option>
                  </select>
                  <input type="text" class="many-to-one typeahead" autocomplete="off" data-value="1">
                  <span class="help-inline"></span> </div>
      </div>
</fieldset>
</fieldset>
<fieldset>
      <legend>Education</legend>
      <div class="control-group fieldcontain  ">
            <table class="table table-hover form-inline" id="education_list">
                  <thead>
                  <tr>
                        <th class="span2">Degree<span class="required-indicator">*</span></th>
                        <th class="span3">Name of Degree</th>
                        <th class="span3">Colleg / School</th>
                        <th class="span3">Board</th>
                        <th class="span2">Passing Year</th>
                        <th class="span1">Percent</th>
                        <th class="span1">Actions</th>
                  </tr>
                  </thead>
                  <tbody>
                  <tr id="educations0" data-index="0" class="educations-tr">
                        <td><input type="hidden" name="educations[0].id" value="" id="educations[0].id">
                              <input type="hidden" name="educations[0].deleted" value="false" id="educations[0].deleted">
                              <input type="hidden" name="educations[0].new" value="true" id="educations[0].new">
                              <div class="controls-1">
                                    <select id="educations[0].degree" name="educations[0].degree.id" class="many-to-one input-small">
                                          <option value="">--Select--</option>
                                          <option value="15" selected="selected">Ph.D</option>
                                          <option value="16">Master's</option>
                                          <option value="17">Bachelor's</option>
                                          <option value="18">Intermediate</option>
                                          <option value="19">S.L.C</option>
                                          <option value="20">Other</option>
                                    </select>
                                    <span class="help-inline"></span> </div></td>
                        <td><div class="controls-1">
                              <input type="text" class="input-small" name="educations[0].nameOfDegree" id="educations[0].nameOfDegree" required="" value="Compluter Science">
                              <span class="help-inline"></span> </div></td>
                        <td><div class="controls-1">
                              <input type="text" class="input-small" name="educations[0].college_school" id="educations[0].college_school" value="school">
                              <span class="help-inline"></span> </div></td>
                        <td><div class="controls-1">
                              <input type="text" name="educations[0].board" class="input-small" id="educations[0].board" value="TU">
                              <span class="help-inline"></span> </div></td>
                        <td><div class="controls-1">
                              <select name="educations[0].graduationYear" class="input-small" id="educations[0].graduationYear">
                                    <option value="Running" selected="selected">Running</option>
                                    <option value="2013">2013</option>
                                    <option value="2012">2012</option>
                                    <option value="2011">2011</option>
                                    <option value="2010">2010</option>
                                    <option value="2009">2009</option>
                                    <option value="2008">2008</option>
                                    <option value="2007">2007</option>
                                    <option value="2006">2006</option>
                                    <option value="2005">2005</option>
                                    <option value="2004">2004</option>
                              </select>
                              <span class="help-inline"></span> </div></td>
                        <td><div class="controls-1">
                              <input type="text" name="educations[0].percent" class="input-mini" id="educations[0].percent" value="">
                              <span class="help-inline"></span> </div></td>
                        <td><i class="icon-trash del-educations" style="cursor: pointer;"></i></td>
                  </tr>
                  </tbody>
            </table>
            <input type="button" value="Add Education" onclick="addEducation();" class="add">
            <span class="help-inline"></span> </div>
      <div id="educations_container"></div>
</fieldset>
<fieldset>
      <legend>Training</legend>
      <div class="control-group fieldcontain  ">
            <table class="table table-hover form-inline" id="training_list">
                  <thead>
                  <tr>
                        <th class="span2">Topic<span class="required-indicator">*</span></th>
                        <th class="span3">Training Objective</th>
                        <th class="span3">Duration</th>
                        <th class="span3">Training Center</th>
                        <th class="span1">Actions</th>
                  </tr>
                  </thead>
                  <tbody>
                  <tr id="trainings0" class="trainings-tr">
                        <td><input type="hidden" name="trainings[0].id" value="" id="trainings[0].id">
                              <input type="hidden" name="trainings[0].deleted" value="false" id="trainings[0].deleted">
                              <input type="hidden" name="trainings[0].new" value="true" id="trainings[0].new">
                              <div class="controls-1">
                                    <input type="text" name="trainings[0].topic" class="input-small" required="" value="Java" id="trainings[0].topic">
                                    <span class="help-inline"></span> </div></td>
                        <td><div class="controls-1">
                              <input type="text" class="input-small" name="trainings[0].trainingObjective" id="trainings[0].trainingObjective" required="" value="Basic java">
                              <span class="help-inline"></span> </div></td>
                        <td><div class="controls-1">
                              <input type="text" class="input-small" name="trainings[0].duration" id="trainings[0].duration" value="3 month">
                              <span class="help-inline"></span> </div></td>
                        <td><div class="controls-1">
                              <input type="text" name="trainings[0].trainingCenter" class="input-small" id="trainings[0].trainingCenter" value="Ligon tech">
                              <span class="help-inline"></span> </div></td>
                        <td><i class="icon-trash del-trainings" style="cursor: pointer;"></i></td>
                  </tr>
                  </tbody>
            </table>
            <input type="button" value="Add Training" onclick="addTraining();" class="add">
            <span class="help-inline"></span> </div>
</fieldset>
<fieldset>
      <legend>Language</legend>
      <div class="control-group fieldcontain  ">
            <table class="table table-hover form-inline" id="language_list">
                  <thead>
                  <tr>
                        <th class="span2">Language<span class="required-indicator">*</span></th>
                        <th class="span3">Reading</th>
                        <th class="span3">Writing</th>
                        <th class="span3">Speaking</th>
                        <th class="span1">Actions</th>
                  </tr>
                  </thead>
                  <tbody>
                  </tbody>
            </table>
            <input type="button" value="Add language" onclick="addlanguage();" class="add">
            <span class="help-inline"></span> </div>
</fieldset>
<fieldset id="nominee">
      <legend>Nominee</legend>
      <div class="control-group fieldcontain  ">
            <label for="nominee" class="control-label">Nominee</label>
            <div class="controls">
                  <input type="text" name="nominee" value="nominee" id="nominee" class="medium">
                  <span class="help-inline"></span> </div>
      </div>
      <div class="control-group fieldcontain  ">
            <label for="nomineeAddress" class="control-label">Nominee Address</label>
            <div class="controls">
                  <input type="text" name="nomineeAddress" value="nominee Address" id="nomineeAddress" class="medium">
                  <span class="help-inline"></span> </div>
      </div>
      <div class="control-group fieldcontain  ">
            <label for="nomineeContactNumber" class="control-label">Nominee Contact Number</label>
            <div class="controls">
                  <input type="text" name="nomineeContactNumber" value="5876887" id="nomineeContactNumber" class="medium">
                  <span class="help-inline"></span> </div>
      </div>
      <div class="control-group fieldcontain  ">
            <label for="relation" class="control-label">Relation</label>
            <div class="controls">
                  <input type="text" name="relation" value="wife" id="relation" class="medium">
                  <span class="help-inline"></span> </div>
      </div>
</fieldset>
<fieldset id="otherInfo">
      <legend>Other Info</legend>
      <div class="control-group fieldcontain  ">
            <label for="jobCategory" class="control-label">Job Category</label>
            <div class="controls"><a href="javascript:void(0)" id="link_jobCategory" class="mulitselect_link">1 selected</a>
                  <select name="jobCategory" id="jobCategory" multiple="multiple" size="5" class="many-to-many" style="display: none;">
                        <option value="1" selected="selected">Labor</option>
                        <option value="2">Manager</option>
                        <option value="3">Store Keeper</option>
                  </select>
                  <span class="help-inline"></span> </div>
      </div>
      <div class="control-group fieldcontain  ">
            <label for="localAgent" class="control-label">Local Agent</label>
            <div class="controls">
                  <select id="localAgent" name="localAgent.id" class="large">
                        <option value="">--Select--</option>
                        <option value="1" selected="selected">Local Agent Nepal</option>
                  </select>
                  <span class="help-inline"></span> </div>
      </div>
      <div class="control-group fieldcontain  ">
            <label for="otherDescription" class="control-label">Other Description</label>
            <div class="controls">
                  <input type="text" name="otherDescription" value="yahoo" id="otherDescription" class="large">
                  <span class="help-inline"></span> </div>
      </div>
      <div class="control-group fieldcontain  ">
            <label for="workExperience" class="control-label">Work Experience</label>
            <div class="controls">
                  <input type="text" name="workExperience" value="experience" id="workExperience" class="large">
                  <span class="help-inline"></span> </div>
      </div>
</fieldset>
<fieldset>
      <legend>Passport</legend>
      <div class="control-group fieldcontain  ">
            <label for="passport.issuedDate" class="control-label">Issued Date</label>
            <div class="controls">
                  <div class="input-prepend date" id="issuedDate" data-date="2009-10-01" data-date-format="yyyy-mm-dd"> <span class="add-on"><i class="icon-th"></i></span>
                        <input type="text" name="passport.issuedDate" id="passport.issuedDate" required="" value="2009-10-01" size="16" class="small" readonly="readonly">
                  </div>
                  <span class="help-inline"></span> </div>
      </div>
      <div class="control-group fieldcontain  ">
            <label for="passport.expiryDate" class="control-label">Expiry Date</label>
            <div class="controls">
                  <div class="input-prepend date" id="expiryDate" data-date="2019-10-01" data-date-format="yyyy-mm-dd"> <span class="add-on"><i class="icon-th"></i></span>
                        <input type="text" name="passport.expiryDate" id="passport.expiryDate" required="" value="2019-10-01" size="16" class="small" readonly="readonly">
                  </div>
                  <span class="help-inline"></span> </div>
      </div>
      <div class="control-group fieldcontain  ">
            <label for="passport.issuedAddress" class="control-label">Issued Address</label>
            <div class="controls">
                  <input type="text" name="passport.issuedAddress" value="kathmandu" id="passport.issuedAddress" class="large">
                  <span class="help-inline"></span> </div>
      </div>
      <div class="control-group fieldcontain  ">
            <label for="passport.issuedBy" class="control-label">Issued By</label>
            <div class="controls">
                  <input type="text" name="passport.issuedBy" value="issuedby" id="passport.issuedBy" class="large">
                  <span class="help-inline"></span> </div>
      </div>
      <div class="control-group fieldcontain  ">
            <label for="passport.number" class="control-label">Number</label>
            <div class="controls">
                  <input type="text" name="passport.number" value="passport number" id="passport.number" class="large">
                  <span class="help-inline"></span> </div>
      </div>
      <div class="control-group fieldcontain  ">
            <label for="passport.remarks" class="control-label">Remarks</label>
            <div class="controls">
                  <textarea name="passport.remarks" id="passport.remarks" class="large">passport remark</textarea>
                  <span class="help-inline"></span> </div>
      </div>
</fieldset>
</fieldset>
<fieldset class="buttons">
      <div class="form-actions">
            <button type="submit" class="button"> <i class="icon-ok icon-white"></i> Create </button>
      </div>
</fieldset>
</form>

</body>
</html>
