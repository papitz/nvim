local M = {}
-- count the depth of a path
local function countSlashes(str)
  local _, count = string.gsub(str, '/', '')
  return count
end

local dartTestPath = function(path)
  local testPath = string.gsub(path, '/lib/', '/test/')
  testPath = string.gsub(testPath, '.dart', '_test.dart')
  local libSubPath = path:match('(lib/.+/[^/]+)')
  local depth = countSlashes(libSubPath)
  local relativeOriginPath = string.rep('../', depth) .. libSubPath
  return testPath, relativeOriginPath
end

local pythonTestPath = function(path)
  local testPath = string.gsub(path, '/app/', '/tests/')
  local basename = vim.fs.basename(path)
  print(basename)
  local testName = "test_" .. basename
  testPath = string.gsub(testPath, basename, testName)
  local appSubPath = path:match('(app/.+/[^/]+)')
  local depth = countSlashes(appSubPath)
  local relativeOriginPath = string.rep('../', depth) .. appSubPath
  return testPath, relativeOriginPath
end

local rubyTestPath = function(path)
  local testPath = string.gsub(path, '/app/', '/test/')
  testPath = string.gsub(testPath, '.rb', '_test.rb')
  local appSubPath = path:match('(app/.+/[^/]+)')
  local depth = countSlashes(appSubPath)
  local relativeOriginPath = string.rep('../', depth) .. appSubPath
  return testPath, relativeOriginPath
end

local dartContent = [[
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TODO', () {
    test('TODO', () {
      // TODO: Implement tests      
    });
  });
}
]]

local rubyContent = [[
require 'test_helper'

class TODO < ActiveSupport::TestCase
  test 'TODO' do
  end
end
]]

local pythonContent = [[
import pytest
]]

local fileTypeContent = {
  ['dart'] = dartContent,
  ['ruby'] = rubyContent,
  ['python'] = pythonContent,
}

local fileTypeHandlers = {
  ['dart'] = dartTestPath,
  ['ruby'] = rubyTestPath,
  ['python'] = pythonTestPath,
}

local function writeToTestFile(finalTestPath, relativeOriginPath, imports, content)
  -- If we dont have any content or imports we can still at least generate the file
  content = content or ''
  imports = imports or ''
  content = imports .. content
  local dirPath = string.match(finalTestPath, '(.*/)')
  local commentString = vim.api.nvim_get_option_value('commentstring', { scope = 'local' }):match('^(.*)%%s')
  print(dirPath)
  os.execute('mkdir -p ' .. dirPath)
  local file = io.open(finalTestPath, 'w')
  if file then
    file:write(commentString .. 'Test for ' .. relativeOriginPath .. '\n' .. content)
    file:close()
    vim.api.nvim_command('edit ' .. finalTestPath)
  else
    print('Failed to create test file: ' .. finalTestPath)
  end
end

local function get_last_match(str, pattern)
  local last_match = nil
  for match in string.gmatch(str, pattern) do
    last_match = match
  end
  return last_match
end

local function concat_all_matches(str, pattern)
  local matches = {}
  for match in string.gmatch(str, pattern) do
    table.insert(matches, match)
  end
  return table.concat(matches, '\n')
end

-- This should get the proposed content that we use for static generation
local generateTestWithCopilot = function(content, callback, selection)
  local copilot = require('CopilotChat')
  copilot.config.callback = function(response)
    local delim = '```'
    local start_delim = delim .. '.-\n'
    local pattern = start_delim .. '(.-)' .. delim
    local code_in_response = concat_all_matches(response, pattern)
    callback(code_in_response)
    copilot.config.callback = nil
  end
  copilot.ask(
    'Generate tests for this code. Try to test every part of the code. Make a complete test suite and not a simplified version of it. Fill out every test you write rather than just giving me templates I have to fill out. If possible do the tests without Mocking. If it is needed, explicetly write the code to Mock the classes as well. Leave out imports. The code you give as test code should have this structure: '
      .. content,
    { selection = selection }
  )
end

local createNewTestFileCopilot = function(filePath, relativeOriginPath, content)
  local select = require('CopilotChat.select')
  local file_callback = function(code_in_response)
    writeToTestFile(filePath, relativeOriginPath, code_in_response)
  end

  generateTestWithCopilot(content, file_callback, select.buffer)
end

-- Create test file and open as new buffer
function M.makeTestFile(useCopilot)
  useCopilot = useCopilot or false
  local filetype = vim.bo.filetype
  local filePath = vim.fn.expand('%:p')
  local handler = fileTypeHandlers[filetype]
  local content = fileTypeContent[filetype]

  if handler then
    local finalTestPath, relativeOriginPath = handler(filePath)
    local file = io.open(finalTestPath, 'r')
    if file then
      print('Test file already exists: ' .. finalTestPath)
      file:close()
      vim.api.nvim_command('edit ' .. finalTestPath)
      return
    else
      if useCopilot then
        createNewTestFileCopilot(finalTestPath, relativeOriginPath, content)
        return
      else
        writeToTestFile(finalTestPath, relativeOriginPath, content)
      end
    end
  else
    print('No handler for filetype: ' .. filetype)
  end
end

function M.generateTestsForSelection()
  local filetype = vim.bo.filetype
  local content = fileTypeContent[filetype]
  local select = require('CopilotChat.select')
  local copyCodeCallback = function(code_in_response)
    vim.fn.setreg('"', code_in_response)
    vim.notify('Code copied to clipboard')
  end
  generateTestWithCopilot(content, copyCodeCallback, select.visual)
end

function M.makeTestFileWithCopilot()
  makeTestFile(true)
end
return M
