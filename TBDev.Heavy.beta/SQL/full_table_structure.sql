-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 10, 2011 at 01:38 AM
-- Server version: 5.1.41
-- PHP Version: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: 'bobtest'
--

-- --------------------------------------------------------

--
-- Table structure for table 'attachmentdownloads'
--

CREATE TABLE attachmentdownloads (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  fileid int(10) NOT NULL DEFAULT '0',
  username varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  userid int(10) NOT NULL DEFAULT '0',
  `date` int(11) NOT NULL DEFAULT '0',
  downloads int(10) unsigned NOT NULL,
  PRIMARY KEY (id),
  KEY fileid_userid (fileid,userid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table 'attachments'
--

CREATE TABLE attachments (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  topicid int(10) unsigned NOT NULL DEFAULT '0',
  postid int(10) unsigned NOT NULL DEFAULT '0',
  filename varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  size bigint(20) unsigned NOT NULL DEFAULT '0',
  `owner` int(10) unsigned NOT NULL DEFAULT '0',
  downloads int(10) unsigned NOT NULL DEFAULT '0',
  added int(11) NOT NULL DEFAULT '0',
  `type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (id),
  KEY topicid (topicid),
  KEY postid (postid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table 'avps'
--

CREATE TABLE avps (
  arg varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  value_s text COLLATE utf8_unicode_ci NOT NULL,
  value_i int(11) NOT NULL DEFAULT '0',
  value_u int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (arg)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table 'bans'
--

CREATE TABLE bans (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  added int(11) NOT NULL,
  addedby int(10) unsigned NOT NULL DEFAULT '0',
  `comment` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `first` int(11) DEFAULT NULL,
  `last` int(11) DEFAULT NULL,
  PRIMARY KEY (id),
  KEY first_last (`first`,`last`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table 'blocks'
--

CREATE TABLE blocks (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  userid int(10) unsigned NOT NULL DEFAULT '0',
  blockid int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (id),
  UNIQUE KEY userfriend (userid,blockid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table 'categories'
--

CREATE TABLE categories (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  image varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  cat_desc varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'No Description',
  PRIMARY KEY (id)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table 'cleanup'
--

CREATE TABLE cleanup (
  clean_id int(10) NOT NULL AUTO_INCREMENT,
  clean_title char(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  clean_file char(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  clean_time int(11) NOT NULL DEFAULT '0',
  clean_increment int(11) NOT NULL DEFAULT '0',
  clean_cron_key char(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  clean_log tinyint(1) NOT NULL DEFAULT '0',
  clean_desc text COLLATE utf8_unicode_ci NOT NULL,
  clean_on tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (clean_id),
  KEY clean_time (clean_time)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table 'cleanup_log'
--

CREATE TABLE cleanup_log (
  clog_id int(10) NOT NULL AUTO_INCREMENT,
  clog_event char(150) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  clog_time int(11) NOT NULL DEFAULT '0',
  clog_ip char(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  clog_desc text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (clog_id)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table 'comments'
--

CREATE TABLE comments (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user` int(10) unsigned NOT NULL DEFAULT '0',
  torrent int(10) unsigned NOT NULL DEFAULT '0',
  added int(11) NOT NULL,
  `text` text COLLATE utf8_unicode_ci NOT NULL,
  ori_text text COLLATE utf8_unicode_ci NOT NULL,
  editedby int(10) unsigned NOT NULL DEFAULT '0',
  editedat int(11) NOT NULL,
  PRIMARY KEY (id),
  KEY `user` (`user`),
  KEY torrent (torrent)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table 'countries'
--

CREATE TABLE countries (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  flagpic varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table 'files'
--

CREATE TABLE files (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  torrent int(10) unsigned NOT NULL DEFAULT '0',
  filename varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  size bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (id),
  KEY torrent (torrent),
  FULLTEXT KEY filename (filename)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table 'forums'
--

CREATE TABLE forums (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  description varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  sort tinyint(3) unsigned NOT NULL DEFAULT '0',
  forid tinyint(4) DEFAULT '0',
  postcount int(10) unsigned NOT NULL DEFAULT '0',
  topiccount int(10) unsigned NOT NULL DEFAULT '0',
  minclassread tinyint(3) unsigned NOT NULL DEFAULT '0',
  minclasswrite tinyint(3) unsigned NOT NULL DEFAULT '0',
  minclasscreate tinyint(3) unsigned NOT NULL DEFAULT '0',
  place int(10) NOT NULL DEFAULT '-1',
  PRIMARY KEY (id)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table 'forum_mods'
--

CREATE TABLE forum_mods (
  id int(10) NOT NULL AUTO_INCREMENT,
  uid int(10) NOT NULL DEFAULT '0',
  fid int(10) NOT NULL DEFAULT '0',
  `user` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (id),
  KEY uid (uid,fid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table 'forum_parents'
--

CREATE TABLE forum_parents (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  description varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  minclassview tinyint(3) unsigned NOT NULL DEFAULT '0',
  forid tinyint(3) unsigned NOT NULL DEFAULT '1',
  sort tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (id)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table 'forum_polls'
--

CREATE TABLE forum_polls (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  added int(11) NOT NULL DEFAULT '0',
  question text COLLATE utf8_unicode_ci NOT NULL,
  option0 varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  option1 varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  option2 varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  option3 varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  option4 varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  option5 varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  option6 varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  option7 varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  option8 varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  option9 varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  option10 varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  option11 varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  option12 varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  option13 varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  option14 varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  option15 varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  option16 varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  option17 varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  option18 varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  option19 varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  sort enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table 'forum_poll_answers'
--

CREATE TABLE forum_poll_answers (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  pollid int(10) unsigned NOT NULL DEFAULT '0',
  userid int(10) unsigned NOT NULL DEFAULT '0',
  selection tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (id),
  KEY pollid (pollid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table 'forum_subs'
--

CREATE TABLE forum_subs (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  userid int(10) unsigned NOT NULL DEFAULT '0',
  topicid int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table 'friends'
--

CREATE TABLE friends (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  userid int(10) unsigned NOT NULL DEFAULT '0',
  friendid int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (id),
  UNIQUE KEY userfriend (userid,friendid)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table 'messages'
--

CREATE TABLE messages (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  sender int(10) unsigned NOT NULL DEFAULT '0',
  receiver int(10) unsigned NOT NULL DEFAULT '0',
  added int(11) NOT NULL,
  `subject` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'No Subject',
  msg text COLLATE utf8_unicode_ci,
  unread enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  poster bigint(20) unsigned NOT NULL DEFAULT '0',
  location smallint(6) NOT NULL DEFAULT '1',
  saved enum('no','yes') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (id),
  KEY receiver (receiver)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table 'news'
--

CREATE TABLE news (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  userid int(11) NOT NULL DEFAULT '0',
  added int(11) NOT NULL,
  body text COLLATE utf8_unicode_ci NOT NULL,
  headline varchar(150) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'TBDEV.NET News',
  PRIMARY KEY (id),
  KEY added (added)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table 'peers'
--

CREATE TABLE peers (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  torrent int(10) unsigned NOT NULL DEFAULT '0',
  info_hash varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  passkey varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  peer_id varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `compact` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  ip varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `port` smallint(5) unsigned NOT NULL DEFAULT '0',
  uploaded bigint(20) unsigned NOT NULL DEFAULT '0',
  downloaded bigint(20) unsigned NOT NULL DEFAULT '0',
  to_go bigint(20) unsigned NOT NULL DEFAULT '0',
  seeder enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  started int(11) NOT NULL,
  last_action int(11) NOT NULL,
  connectable enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  userid int(10) unsigned NOT NULL DEFAULT '0',
  agent varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  finishedat int(10) unsigned NOT NULL DEFAULT '0',
  downloadoffset bigint(20) unsigned NOT NULL DEFAULT '0',
  uploadoffset bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (id),
  UNIQUE KEY torrent_peer_id (torrent,peer_id),
  KEY torrent (torrent),
  KEY torrent_seeder (torrent,seeder),
  KEY last_action (last_action),
  KEY connectable (connectable),
  KEY userid (userid),
  KEY passkey (passkey),
  KEY torrent_connect (torrent,connectable)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table 'pmboxes'
--

CREATE TABLE pmboxes (
  id int(11) NOT NULL AUTO_INCREMENT,
  userid int(11) NOT NULL,
  boxnumber tinyint(4) NOT NULL DEFAULT '2',
  `name` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table 'posts'
--

CREATE TABLE posts (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  topicid int(10) unsigned NOT NULL DEFAULT '0',
  userid int(10) unsigned NOT NULL DEFAULT '0',
  added int(22) DEFAULT '0',
  body longtext CHARACTER SET utf8 COLLATE utf8_bin,
  editedby int(10) unsigned NOT NULL DEFAULT '0',
  editedat int(11) DEFAULT '0',
  post_history mediumtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  posticon int(2) NOT NULL DEFAULT '0',
  anonymous enum('yes','no') CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'no',
  PRIMARY KEY (id),
  KEY topicid (topicid),
  KEY userid (userid),
  FULLTEXT KEY body (body)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table 'readposts'
--

CREATE TABLE readposts (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  userid int(10) unsigned NOT NULL DEFAULT '0',
  topicid int(10) unsigned NOT NULL DEFAULT '0',
  lastpostread int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (id),
  KEY topicid (topicid)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table 'reputation'
--

CREATE TABLE reputation (
  reputationid int(11) unsigned NOT NULL AUTO_INCREMENT,
  reputation int(10) NOT NULL DEFAULT '0',
  whoadded int(10) NOT NULL DEFAULT '0',
  reason varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  dateadd int(10) NOT NULL DEFAULT '0',
  postid int(10) NOT NULL DEFAULT '0',
  userid mediumint(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (reputationid),
  KEY userid (userid),
  KEY whoadded (whoadded),
  KEY multi (postid,userid),
  KEY dateadd (dateadd)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table 'reputationlevel'
--

CREATE TABLE reputationlevel (
  reputationlevelid int(11) unsigned NOT NULL AUTO_INCREMENT,
  minimumreputation int(10) NOT NULL DEFAULT '0',
  `level` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (reputationlevelid),
  KEY reputationlevel (minimumreputation)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table 'rules'
--

CREATE TABLE rules (
  id int(11) NOT NULL AUTO_INCREMENT,
  cid int(3) unsigned NOT NULL DEFAULT '0',
  heading varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  body text COLLATE utf8_unicode_ci NOT NULL,
  ctime int(11) unsigned NOT NULL DEFAULT '0',
  mtime int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (id),
  KEY cat_id (cid)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table 'rules_categories'
--

CREATE TABLE rules_categories (
  cid int(3) unsigned NOT NULL AUTO_INCREMENT,
  rcat_name varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  min_class_read int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (cid)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table 'searchcloud'
--

CREATE TABLE searchcloud (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  searchedfor varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  howmuch int(10) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY searchedfor (searchedfor)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table 'sitelog'
--

CREATE TABLE sitelog (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  added int(11) NOT NULL,
  txt text COLLATE utf8_unicode_ci,
  PRIMARY KEY (id),
  KEY added (added)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table 'stylesheets'
--

CREATE TABLE stylesheets (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  uri varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (id)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table 'subscriptions'
--

CREATE TABLE subscriptions (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  userid int(10) unsigned NOT NULL DEFAULT '0',
  topicid int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table 'topics'
--

CREATE TABLE topics (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  userid int(10) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  locked enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  forumid int(10) unsigned NOT NULL DEFAULT '0',
  lastpost int(10) unsigned NOT NULL DEFAULT '0',
  sticky enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  views int(10) unsigned NOT NULL DEFAULT '0',
  pollid int(10) unsigned NOT NULL DEFAULT '0',
  anonymous enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (id),
  KEY userid (userid),
  KEY `subject` (`subject`),
  KEY lastpost (lastpost),
  KEY locked_sticky (locked,sticky)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table 'torrents'
--

CREATE TABLE torrents (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  info_hash varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  filename varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  save_as varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  search_text text COLLATE utf8_unicode_ci NOT NULL,
  descr text COLLATE utf8_unicode_ci NOT NULL,
  ori_descr text COLLATE utf8_unicode_ci NOT NULL,
  category int(10) unsigned NOT NULL DEFAULT '0',
  size bigint(20) unsigned NOT NULL DEFAULT '0',
  added int(11) NOT NULL,
  `type` enum('single','multi') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'single',
  numfiles int(10) unsigned NOT NULL DEFAULT '0',
  comments int(10) unsigned NOT NULL DEFAULT '0',
  views int(10) unsigned NOT NULL DEFAULT '0',
  hits int(10) unsigned NOT NULL DEFAULT '0',
  times_completed int(10) unsigned NOT NULL DEFAULT '0',
  leechers int(10) unsigned NOT NULL DEFAULT '0',
  seeders int(10) unsigned NOT NULL DEFAULT '0',
  last_action int(11) NOT NULL,
  visible enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  banned enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `owner` int(10) unsigned NOT NULL DEFAULT '0',
  numratings int(10) unsigned NOT NULL DEFAULT '0',
  ratingsum int(10) unsigned NOT NULL DEFAULT '0',
  nfo text COLLATE utf8_unicode_ci NOT NULL,
  client_created_by char(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  PRIMARY KEY (id),
  UNIQUE KEY info_hash (info_hash),
  KEY `owner` (`owner`),
  KEY visible (visible),
  KEY category_visible (category,visible),
  FULLTEXT KEY ft_search (search_text,ori_descr)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table 'users'
--

CREATE TABLE users (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  username varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  passhash varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  secret varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  passkey varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  email varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('pending','confirmed') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  added int(11) NOT NULL,
  last_login int(11) NOT NULL,
  last_access int(11) NOT NULL,
  forum_access int(11) NOT NULL DEFAULT '0',
  editsecret varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  privacy enum('strong','normal','low') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'normal',
  stylesheet int(10) DEFAULT '1',
  info text COLLATE utf8_unicode_ci,
  signature text COLLATE utf8_unicode_ci,
  signatures enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  acceptpms enum('yes','friends','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  ip varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  class tinyint(3) unsigned NOT NULL DEFAULT '0',
  `language` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'en',
  avatar varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  av_w smallint(3) unsigned NOT NULL DEFAULT '0',
  av_h smallint(3) unsigned NOT NULL DEFAULT '0',
  uploaded bigint(20) unsigned NOT NULL DEFAULT '0',
  downloaded bigint(20) unsigned NOT NULL DEFAULT '0',
  title varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  country int(10) unsigned NOT NULL DEFAULT '0',
  notifs varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  modcomment text COLLATE utf8_unicode_ci NOT NULL,
  enabled enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  avatars enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  donor enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  donoruntil int(11) NOT NULL DEFAULT '0',
  warned enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  warneduntil int(11) NOT NULL DEFAULT '0',
  torrentsperpage int(3) unsigned NOT NULL DEFAULT '0',
  topicsperpage int(3) unsigned NOT NULL DEFAULT '0',
  postsperpage int(3) unsigned NOT NULL DEFAULT '0',
  deletepms enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  savepms enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  reputation int(10) NOT NULL DEFAULT '10',
  time_offset varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  dst_in_use tinyint(1) NOT NULL DEFAULT '0',
  auto_correct_dst tinyint(1) NOT NULL DEFAULT '1',
  forum_mod enum('yes','no') CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'no',
  forums_mod varchar(320) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  subscription_pm enum('yes','no') CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'no',
  mood int(10) NOT NULL DEFAULT '1',
  anonymous enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (id),
  UNIQUE KEY username (username),
  KEY ip (ip),
  KEY uploaded (uploaded),
  KEY downloaded (downloaded),
  KEY country (country),
  KEY last_access (last_access),
  KEY enabled (enabled),
  KEY warned (warned),
  KEY pkey (passkey)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
