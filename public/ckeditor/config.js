/*
Copyright (c) 2003-2010, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

CKEDITOR.editorConfig = function( config )
{
	config.toolbar_Full =[
	 	['Source','-','NewPage','Preview','-','Templates'],
	 	['Bold','Italic','Underline','Strike','Subscript','Superscript'],
	 	['NumberedList','BulletedList','-','Outdent','Indent','Blockquote','CreateDiv'],
	 	['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
	 	['BidiLtr', 'BidiRtl' ],
	 	['Link','Unlink','Anchor'],
	 	['Image','Flash','Table','HorizontalRule','Smiley','SpecialChar','PageBreak'],
	 	'/',
	 	['Styles','Format','Font','FontSize'],
	 	['TextColor','BGColor'],
	 	['Maximize', 'ShowBlocks']
	];
	config.width=600;

};
