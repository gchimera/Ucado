//
//  Constant.h
//  UcaDO
//
//  Created by Hamid Mehmood on 14/02/17.
//  Copyright © 2017 Hamid Mehmood. All rights reserved.
//

#ifndef Constants_h
#define Constants_h


#define DEV_SERVER          1

#if (DEV_SERVER==1)

/* CMS AUTHENTICATION */
#ifdef DEBUG


#define CMS_URL_BASE                @"http://ucado.b60staging.co.uk/"
#define CMS_AUTH_TOKEN              @"devkeyitseasytoremember:)"
// Something to log your sensitive data here

#else

#define CMS_URL_BASE                @"http://ucado.b60hosting.co.uk/"
#define CMS_AUTH_TOKEN              @"UC2D-PD0R-S4RF-U3DO-K4HS"
#endif

#define UCADO_PRIVACY               @"https://www.ucado.co.uk/privacy"
#define UCADO_HINTS                 @"https://www.ucado.co.uk/hints"
#define UCADO_GLOSSARY              @"https://www.ucado.co.uk/glossary"

/*!
 * @brief The constant to enable UcaDo user token in AFSessionManager.h class
 */

static BOOL kIntializeUcaDoUserToken = NO;

//Comunications
static NSString *UCK_InternetConnectionLost = @"InternetConnectionLost";

//Strings constants
static NSString *UCK_ActiveBuyerTab = @"activeBuyerTab";

//Notifications
static NSString *UCK_NewMessage = @"message";

//Other constants

static NSInteger UCK_systemId = 5;

#pragma mark COLOR AND FONTS

//light blue
#define coolBlue  [UIColor colorWithRed:65/255.0f green:161/255.0f blue:180/255.0f alpha:1];

//dark blue
#define lightNavyBlue  [UIColor colorWithRed:37/255.0f green:98/255.0f blue:120/255.0f alpha:1];turtleGreen

//light green
#define turtleGreen  [UIColor colorWithRed:127/255.0f green:183/255.0f blue:85/255.0f alpha:1];

static NSString *UCK_font = @"HelveticaNeue";

static NSString *UCK_font_bold = @"HelveticaNeueBold";

#else

#endif

#define CMS_REGISTER             @"register"
#define CMS_CHECKEMAIL           @"checkEmail"
#define CMS_LOGIN                @"login"
#define CMS_CONFIRM_LOGIN        @"confirmLogin"
#define CMS_UPSERT_PROPERTY      @"upsert-property"
#define CMS_PROPERTIES           @"properties"
#define CMS_MY_PROPERTIES        @"myproperty-list"
#define CMS_RESET_PASSWORD       @"reset-password-request"
#define CMS_FAVORITE             @"reactions"
#define CMS_ALLFAVORITE          @"favourite-properties"
#define ADVERT_LIST              @"advert-list"

/*
 {
 "property_id":"96",
 "body":"Another mesage for actual testing"
 }
 */
#define CMS_POST_MESSAGE         @"send-message"
/*
 {
 "property_id":"99"
 }
 */
#define CMS_FETCH_MESSAGES       @"messages"

#endif /* Constants_h */
