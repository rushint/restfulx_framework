/*******************************************************************************
 * Copyright 2008, Ruboss Technology Corporation.
 * 
 * @author Dima Berastau
 * 
 * This software is dual-licensed under both the terms of the Ruboss Commercial
 * License v1 (RCL v1) as published by Ruboss Technology Corporation and under
 * the terms of the GNU General Public License v3 (GPL v3) as published by the
 * Free Software Foundation.
 *
 * Both the RCL v1 (rcl-1.0.txt) and the GPL v3 (gpl-3.0.txt) are included in
 * the source code. If you have purchased a commercial license then only the
 * RCL v1 applies; otherwise, only the GPL v3 applies. To learn more or to buy a
 * commercial license, please go to http://ruboss.com. 
 ******************************************************************************/
package org.ruboss.utils {
  import flash.net.FileReference;
  
  /**
   * Allows Flash file references to be attached to models. Requires something
   * like attachment_fu or paperclip on the server-side if you are using
   * remote service provider.
   *  
   * @example For attachment_fu use this:
   *  
   * <listing version="3.0">
   *  var ref:RubossFileReference = new RubossFileReference;
   * </listing>
   *  
   * @example For paperclip use this:
   *  
   * <listing version="3.0">
   *  var ref:RubossFileReference = new RubossFileReference("avatar")
   * </listing> 
   *  
   * <p>This will match <code>has_file_attachment :avatar</code> in your Ruby model.</p>
   *  
   * <p>If you pick a different name adjust the argument to constructor accordintly.
   */
  public class RubossFileReference extends FileReference {
    
    /** key name to use (default is "uploaded_data", which is what attachment_fu expects) */
    public var keyName:String;
    
    /**
     * @param keyName keyname to use default "uploaded_data" 
     */
    public function RubossFileReference(keyName:String = "uploaded_data") {
      super();
      this.keyName = keyName;
    }
  }
}